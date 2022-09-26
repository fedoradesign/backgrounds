SUBDIRS = default extras
VERSION = 37.0.1
NAME =  f37-backgrounds-$(VERSION)

all:
	@for i in $(SUBDIRS) ; do \
		(cd $$i; $(MAKE)) ;\
	done;

install:
	@for i in $(SUBDIRS) ; do \
		(cd $$i; $(MAKE) install) ; \
	done;

dist:
	mkdir -p $(NAME)
	cp -a CC-BY-SA-4.0 $(NAME)
	cp -a CC-BY-4.0 $(NAME)
	cp -a CC0-1.0 $(NAME)
	cp -a Attribution $(NAME)
	cp -a Attribution-Extras $(NAME)
	cp -a Makefile $(NAME)
	cp -a default $(NAME)
	cp -a extras $(NAME)
	tar -c --xz -f $(NAME).tar.xz $(NAME)
	rm -rf $(NAME)

