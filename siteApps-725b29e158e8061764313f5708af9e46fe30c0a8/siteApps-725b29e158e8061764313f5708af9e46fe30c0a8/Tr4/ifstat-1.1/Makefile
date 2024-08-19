# Generated automatically from Makefile.in by configure.
srcdir      = .
prefix      = /usr/local
libdir      = ${exec_prefix}/lib
exec_prefix = ${prefix}
datadir     = ${prefix}/share
bindir      = ${exec_prefix}/bin
mandir      = ${prefix}/man
etcdir      = ${prefix}/etc
includedir  = ${prefix}/include

SHELL       = /bin/sh
CC          = gcc
RM          = rm -f
INSTALL	    = /usr/bin/install -c
RANLIB	    = ranlib
CFLAGS      = -I. -g -O2 -DHAVE_CONFIG_H  -DNETSNMP_ENABLE_IPV6 -g -O2 -fstack-protector --param=ssp-buffer-size=4 -Wformat -Werror=format-security -Ulinux -Dlinux=linux -D_REENTRANT -D_GNU_SOURCE -DDEBIAN -fstack-protector -fno-strict-aliasing -pipe -I/usr/local/include -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64 -I/usr/lib/perl/5.14/CORE -D_FORTIFY_SOURCE=2 -I/usr/include
#LDFLAGS     =  -Wl,-z,relro -L/usr/lib -lnetsnmp
LDFLAGS     =  -Wl,-z,relro -L/usr/lib
LIBS        = 
#LIBSRCS	    = drivers.c data.c snmp.c
LIBSRCS	    = drivers.c data.c
SRCS        = ifstat.c $(LIBSRCS)
OBJS        = ${SRCS:.c=.o}
LIBOBJS     = ${LIBSRCS:.c=.o}
TARGET      = ifstat
LIBTARGET   = libifstat.a
TARGETS	    = $(TARGET) 

.SUFFIXES: .c .o

.c.o:
	$(CC) $(CFLAGS) -c $< -o $@

all: $(TARGETS) Makefile

$(TARGET): $(OBJS)
	$(CC) $(OBJS) $(LDFLAGS) $(LIBS) -o $(TARGET)

$(LIBTARGET): $(LIBOBJS)
	ar rv $(LIBTARGET) $(LIBOBJS)
	$(RANLIB) $(LIBTARGET)

clean:
	$(RM) *.o *~ .*~ core \#*\# gmon.out *.bak $(TARGETS)

distclean: clean
	$(RM) config.h config.cache config.log config.status Makefile libifstat-config

maintainer-clean: distclean
	$(RM) configure config.h.in ifstat.1

${srcdir}/configure: configure.in
	cd ${srcdir} && autoconf

${srcdir}/config.h.in: configure.in acconfig.h
	cd ${srcdir} && autoheader

Makefile: Makefile.in config.status
	CONFIG_FILES=Makefile CONFIG_HEADERS= ./config.status

config.status: configure
	./config.status --recheck

libifstat-config: libifstat-config.in
	CONFIG_FILES=libifstat-config CONFIG_HEADERS= ./config.status

install: install-$(TARGET) install-

install-$(TARGET): $(TARGET)
	$(INSTALL) -d -m 755 $(bindir)
	$(INSTALL) -s -m 755 $(TARGET) $(bindir)/$(TARGET)
	$(INSTALL) -d -m 755 $(mandir)/man1
	$(INSTALL) -m 644 ifstat.1 $(mandir)/man1/ifstat.1

install-$(LIBTARGET): $(LIBTARGET) libifstat-config
	$(INSTALL) -d -m 755 $(bindir)
	$(INSTALL) -m 755 libifstat-config $(bindir)/libifstat-config
	$(INSTALL) -d -m 755 $(includedir)
	$(INSTALL) -m 644 ifstat.h $(includedir)/ifstat.h
	$(INSTALL) -d -m 755 $(libdir)
	$(INSTALL) -m 644 $(LIBTARGET) $(libdir)/$(LIBTARGET)

install-: # dependency when not building library

realclean: maintainer-clean

# deps
ifstat.o: ifstat.c ifstat.h config.h
#drivers.o: drivers.c ifstat.h config.h snmp.h
drivers.o: drivers.c ifstat.h config.h
#snmp.o: snmp.c ifstat.h config.h snmp.h

