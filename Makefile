# -*- Makefile -*-
BINDIR   =  /sbin
ETC      =  /etc
MAN1     =  /usr/share/man/man1
MAN5     =  /usr/share/man/man5
DESTDIR  =


install:
	install -d $(DESTDIR)$(BINDIR)
	install -d $(DESTDIR)$(ETC)
	install -d $(DESTDIR)$(MAN1)
	install -d $(DESTDIR)$(MAN5)
	install -m755 shutdown-trigger        $(DESTDIR)$(BINDIR)
	install -m755 shutdown-trigger.conf.EDIT_ME \
		$(DESTDIR)$(ETC)/shutdown-trigger.conf
	install -m755 shutdown-trigger.1      $(DESTDIR)$(MAN1)
	install -m755 shutdown-trigger.conf.5 $(DESTDIR)$(MAN5)

tarball :
	VERSION=$$(grep '^ *version=' shutdown-trigger|sed -e's|^.*=||') ;\
	rm -rf ./shutdown-trigger-$$VERSION ;\
	mkdir ./shutdown-trigger-$${VERSION} ;\
	cp COPYING \
		Makefile \
		shutdown-trigger \
		shutdown-trigger.1 \
		shutdown-trigger.conf.5 \
		shutdown-trigger.conf.EDIT_ME \
	./shutdown-trigger-$${VERSION} ;\
	tar zcf shutdown-trigger-$${VERSION}.tar.gz \
	shutdown-trigger-$${VERSION} ;\
	:

clean :
	VERSION=$$(grep '^ *version=' shutdown-trigger|sed -e's|^.*=||') ;\
	rm -rf ./shutdown-trigger-$${VERSION} ;\
	rm -f shutdown-trigger-$${VERSION}.tar.gz ;\
	:
