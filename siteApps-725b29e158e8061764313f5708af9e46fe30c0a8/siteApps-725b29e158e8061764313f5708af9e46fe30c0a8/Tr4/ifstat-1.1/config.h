/* config.h.  Generated automatically by configure.  */
/* config.h.in.  Generated automatically from configure.in by autoheader 2.13.  */

/* Define as the return type of signal handlers (int or void).  */
#define RETSIGTYPE void

/* Define if you have the ANSI C header files.  */
#define STDC_HEADERS 1

/* Define if you can safely include both <sys/time.h> and <time.h>.  */
#define TIME_WITH_SYS_TIME 1

/* Define if you have the knlist function.  */
/* #undef HAVE_KNLIST */

/* Define if you have the readx function.  */
/* #undef HAVE_READX */

/* Define if you have the sigaction function.  */
#define HAVE_SIGACTION 1

/* Define if you have the snprintf function.  */
#define HAVE_SNPRINTF 1

/* Define if you have the <ctype.h> header file.  */
#define HAVE_CTYPE_H 1

/* Define if you have the <errno.h> header file.  */
#define HAVE_ERRNO_H 1

/* Define if you have the <fcntl.h> header file.  */
#define HAVE_FCNTL_H 1

/* Define if you have the <kstat.h> header file.  */
/* #undef HAVE_KSTAT_H */

/* Define if you have the <kvm.h> header file.  */
/* #undef HAVE_KVM_H */

/* Define if you have the <limits.h> header file.  */
#define HAVE_LIMITS_H 1

/* Define if you have the <net/if.h> header file.  */
#define HAVE_NET_IF_H 1

/* Define if you have the <net/if_dl.h> header file.  */
/* #undef HAVE_NET_IF_DL_H */

/* Define if you have the <net/if_mib.h> header file.  */
/* #undef HAVE_NET_IF_MIB_H */

/* Define if you have the <net/if_types.h> header file.  */
/* #undef HAVE_NET_IF_TYPES_H */

/* Define if you have the <net/if_var.h> header file.  */
/* #undef HAVE_NET_IF_VAR_H */

/* Define if you have the <net/route.h> header file.  */
#define HAVE_NET_ROUTE_H 1

/* Define if you have the <net/soioctl.h> header file.  */
/* #undef HAVE_NET_SOIOCTL_H */

/* Define if you have the <nlist.h> header file.  */
/* #undef HAVE_NLIST_H */

/* Define if you have the <paths.h> header file.  */
/* #undef HAVE_PATHS_H */

/* Define if you have the <signal.h> header file.  */
#define HAVE_SIGNAL_H 1

/* Define if you have the <stdarg.h> header file.  */
#define HAVE_STDARG_H 1

/* Define if you have the <stropts.h> header file.  */
/* #undef HAVE_STROPTS_H */

/* Define if you have the <sys/dlpi.h> header file.  */
/* #undef HAVE_SYS_DLPI_H */

/* Define if you have the <sys/dlpi_ext.h> header file.  */
/* #undef HAVE_SYS_DLPI_EXT_H */

/* Define if you have the <sys/ioctl.h> header file.  */
#define HAVE_SYS_IOCTL_H 1

/* Define if you have the <sys/mbuf.h> header file.  */
/* #undef HAVE_SYS_MBUF_H */

/* Define if you have the <sys/mib.h> header file.  */
/* #undef HAVE_SYS_MIB_H */

/* Define if you have the <sys/param.h> header file.  */
#define HAVE_SYS_PARAM_H 1

/* Define if you have the <sys/socket.h> header file.  */
#define HAVE_SYS_SOCKET_H 1

/* Define if you have the <sys/sockio.h> header file.  */
/* #undef HAVE_SYS_SOCKIO_H */

/* Define if you have the <sys/sysctl.h> header file.  */
/* #undef HAVE_SYS_SYSCTL_H */

/* Define if you have the <sys/termios.h> header file.  */
#define HAVE_SYS_TERMIOS_H 1

/* Define if you have the <sys/time.h> header file.  */
#define HAVE_SYS_TIME_H 1

/* Define if you have the <sys/types.h> header file.  */
#define HAVE_SYS_TYPES_H 1

/* Define if you have the <unistd.h> header file.  */
#define HAVE_UNISTD_H 1

/* Define if you have the socket library (-lsocket).  */
/* #undef HAVE_LIBSOCKET */

/* Define if you want to use /proc to get stats */
#define USE_PROC 1

/* Proc file to poll for stats */
#define PROC_FILE "/proc/net/dev"

/* Define if you want to use kstat to get stats */
/* #undef USE_KSTAT */

/* Define if you want to use if_mib to get stats */
/* #undef USE_IFMIB */

/* Define if you have a ifr_data member in struct ifreq */
/* #undef HAVE_IFREQ_IFR_DATA */

/* Define if you want to use ifdata to get stats */
/* #undef USE_IFDATA */

/* Define this if you want to use roue(4) sysctl to get stats */
/* #undef USE_ROUTE */

/* Define if knlist needs 3 arguments */
/* #undef HAVE_KNLIST_ARGS3 */

/* Define if you have the kvm(3) interface */
/* #undef HAVE_KVM */

/* Define if you have a if_xname member in struct ifnet */
/* #undef HAVE_IFNET_IF_XNAME */

/* Define if you have a if_next member in struct ifnet */
/* #undef HAVE_IFNET_IF_NEXT */

/* Define if you have a if_link member in struct ifnet */
/* #undef HAVE_IFNET_IF_LINK */

/* Define if you want to use kvm to get stats */
/* #undef USE_KVM */

/* Define if you want to use dlpi to get stats */
/* #undef USE_DLPI */

/* Define if you want to use win32 to get stats */
/* #undef USE_WIN32 */

/* Define if you want to use ioctls to get if list */
#define USE_IOCTL 1

/* Define if you have a sa_len member in struct sockaddr */
/* #undef HAVE_SOCKADDR_SA_LEN */

/* Define if you want ot use if_nameindex to find interfaces */
#define USE_IFNAMEINDEX 1

/* Define if you have SNMP support */
#define USE_SNMP 0

/* Define if your SNMP implementation is net-snmp v5.0 or greater */
#define HAVE_NET_SNMP 0

/* Version */
#define VERSION "1.1"

