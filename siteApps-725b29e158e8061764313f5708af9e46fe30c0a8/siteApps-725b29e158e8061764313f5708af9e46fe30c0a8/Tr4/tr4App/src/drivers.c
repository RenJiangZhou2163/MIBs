/*
 * ifstat - InterFace STATistics
 * Copyright (c) 2001, Gaël Roualland <gael.roualland@dial.oleane.com>
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 * 
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
 *
 * $Id: drivers.c,v 1.45 2003/11/22 01:27:51 gael Exp $
 */

#include <sys/types.h>
#include <sys/param.h>
#include <unistd.h>
#include <string.h>
#include <ctype.h>
#include <sys/socket.h>
#include <sys/ioctl.h>
#include <net/if.h>
#include <fcntl.h>
#include <errno.h>
#include <limits.h>
#include <stdio.h>
#include <stdlib.h>
#include "ifstat.h"

#define USE_PROC 1

/* Proc file to poll for stats */
#define PROC_FILE "/proc/net/dev"

static void examine_interface(struct ifstat_list *ifs, char *name,
			      int ifflags, int iftype) 
{
#ifdef IFF_LOOPBACK
  if ((ifflags & IFF_LOOPBACK) && !(ifs->flags & IFSTAT_LOOPBACK))
    return;
#endif
#ifdef IFF_UP
  if (!(ifflags & IFF_UP) && !(ifs->flags & IFSTAT_DOWN))
    return;
#endif  
#ifdef IFT_PFLOG
  /* assume PFLOG interfaces are loopbacks (on OpenBSD) */
  if (iftype == IFT_PFLOG && !(ifs->flags & IFSTAT_LOOPBACK))
    return;
#endif
  ifstat_add_interface(ifs, name, 0);
}

static int ioctl_map_ifs(int sd,
			 int (*mapf)(int sd, struct ifreq *ifr, void *data),
			 void *mdata) {
  struct if_nameindex *iflist, *cur;
  struct ifreq ifr;
  
  if ((iflist = if_nameindex()) == NULL) {
    ifstat_perror("if_nameindex");
    return 0;
  }

  for(cur = iflist; cur->if_index != 0 && cur->if_name != NULL; cur++) {
    memcpy(ifr.ifr_name, cur->if_name, sizeof(ifr.ifr_name));
    ifr.ifr_name[sizeof(ifr.ifr_name) - 1] = '\0';
    if (!mapf(sd, &ifr, mdata))
      return 0;
  }
  if_freenameindex(iflist);
  return 1;
}

static int ioctl_map_scan(int sd, struct ifreq *ifr, void *data) {
  
  if (ioctl(sd, SIOCGIFFLAGS, (char *)ifr) != 0)
    return 1;
  examine_interface((struct ifstat_list *) data, ifr->ifr_name,
		    ifr->ifr_flags, 0);
  return 1;
}

static int ioctl_scan_interfaces(struct ifstat_driver *driver,
				 struct ifstat_list *ifs) {
  int sd;

  if ((sd = socket(AF_INET, SOCK_DGRAM, 0)) < 0) {
    ifstat_perror("socket");
    return 0;
  }

  ioctl_map_ifs(sd, &ioctl_map_scan, (void *) ifs);
  close(sd);
  
  return 1;
} 
#ifdef USE_PROC
struct proc_driver_data {
  char *file;
  int checked;
};

static int proc_open_driver(struct ifstat_driver *driver,
			    char *options) {
  struct proc_driver_data *data;

  printf("Proc: Open Driver\n");

  if ((data = malloc(sizeof(struct proc_driver_data))) == NULL) {
    ifstat_perror("malloc");
    return 0;
  }

  data->file = (options != NULL) ? strdup(options) : NULL;
  data->checked = 0;
  driver->data = (void *) data;

  return 1;
}

static void proc_close_driver(struct ifstat_driver *driver) {
  struct proc_driver_data *data = driver->data;

  printf("Proc: Close Driver\n");

  if (data->file != NULL)
    free(data->file);
  free(data);
}

static int proc_get_stats(struct ifstat_driver *driver,
			  struct ifstat_list *ifs) {
  char buf[1024];
  FILE *f;
  char *iface, *stats;
  unsigned long bytesin, bytesout;
  struct ifstat_data *cur;
  struct proc_driver_data *data = driver->data;
  char *file;

  if (data->file != NULL)
    file = data->file;
  else
    file = PROC_FILE;

  if ((f = fopen(file, "r")) == NULL) {
    ifstat_error("can't open %s: %s", file, strerror(errno));
    return 0;
  }

  /* check first lines */
  if (fgets(buf, sizeof(buf), f) == NULL)
    goto badproc;
  if (!data->checked && strncmp(buf, "Inter-|", 7))
    goto badproc;
  if (fgets(buf, sizeof(buf), f) == NULL)
    goto badproc;
  if (!data->checked) {
    if (strncmp(buf, " face |by", 9))
      goto badproc;
    data->checked = 1;
  }

  while (fgets(buf, sizeof(buf), f) != NULL) {
    if ((stats = strchr(buf, ':')) == NULL)
      continue;
    *stats++ = '\0';
    iface = buf;
    while (*iface == ' ')
      iface++;
    if (*iface == '\0')
      continue;
    if (sscanf(stats, "%lu %*u %*u %*u %*u %*u %*u %*u %lu %*u", &bytesin, &bytesout) != 2)
      continue;
    
    if ((cur = ifstat_get_interface(ifs, iface)) != NULL)
      ifstat_set_interface_stats(cur, bytesin, bytesout);
  }
  fclose(f);
  return 1;

 badproc:
  fclose(f);
  ifstat_error("%s: unsupported format.", file);
  return 0;
}
#endif

static struct ifstat_driver drivers[] = 
{
  { "proc", &proc_open_driver, &ioctl_scan_interfaces, &proc_get_stats,
    &proc_close_driver },
  { NULL } 
};
  
int ifstat_get_driver(char *name, struct ifstat_driver *driver) {
  int num = 0;
  
  if (name != NULL) 
    for (num = 0; drivers[num].name != NULL; num++)
      if (!strcasecmp(drivers[num].name, name))
	break;

  if (drivers[num].name == NULL)
    return 0;

  memcpy(driver, &(drivers[num]), sizeof(struct ifstat_driver));
  driver->data = NULL;
  return 1;
}

char* ifstat_list_drivers() 
{
  int num;
  int len = 0, pos = 0;
  char *res;
  
  for(num = 0; drivers[num].name != NULL; num++)
    len += strlen(drivers[num].name) + 2;

  if ((res = malloc(len + 1)) == NULL) {
    ifstat_perror("malloc");
    return NULL;
  }

  for(num = 0; drivers[num].name != NULL; num++) {
    if (num != 0) {
      memcpy(res + pos, ", ", 2);
      pos += 2;
    }
    len = strlen(drivers[num].name);
    memcpy(res + pos, drivers[num].name, len);
    pos += len;
  }
  res[pos] = '\0';
  return res;
}
