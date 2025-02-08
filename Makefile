SUBDIRS = default
VERSION = 42.0.0
NAME =  f42-backgrounds-$(VERSION)

WP_NAME=f42
WP_BIGNAME=F42

WP_INSTALL_ROOT=$(DESTDIR)/usr/share
WP_REL_PATH=backgrounds/$(WP_NAME)

WP_BG_ROOT=$(WP_INSTALL_ROOT)/$(WP_REL_PATH)
KDE_BG_ROOT=$(WP_INSTALL_ROOT)/wallpapers/
GNOME_BG_DIR=$(WP_INSTALL_ROOT)/gnome-background-properties
MATE_BG_DIR=$(WP_INSTALL_ROOT)/mate-background-properties
MATE_BG_DEFAULT=$(WP_INSTALL_ROOT)/backgrounds/mate
PLASMA_BG_DIR=$(WP_INSTALL_ROOT)/plasma/desktoptheme
XFCE_BG_DIR=$(WP_INSTALL_ROOT)/xfce4/backdrops

MAGICK=/usr/bin/magick
MKDIR=/bin/mkdir -p
INSTALL=/usr/bin/install -p -m644 -D
LN_S=/bin/ln -s
CP=/bin/cp -p
TOUCH_R=/bin/touch -r
BASENAME=/bin/basename

RESOLUTIONS= \
	1280x1024 640x480 800x600 1024x768 1152x864 1200x900 \
	1280x960 1440x1080 1600x1200 1600x1280 1920x1440 2048x1536 \
	800x480 1024x600 1152x720 1280x720 1280x768 1280x800 \
	1366x768 1440x900 1680x1050 1920x1080 1920x1200 1920x1280 \
	2160x1440 2304x1440 2560x1440 2560x1600 2960x1440 \
	3000x2000 3200x1800 3440x1440 3840x2160

# Pass all variables to sub-makes
export

.PHONY: $(SUBDIRS) install all

all:

$(SUBDIRS):
	$(MAKE) -C $@ install

install: $(SUBDIRS)

dist:
	mkdir -p $(NAME)
	cp -a CC-BY-SA-4.0 $(NAME)
	cp -a Attribution $(NAME)
	cp -a Attribution-Extras $(NAME)
	cp -a Makefile $(NAME)
	cp -a default $(NAME)
	cp -a extras $(NAME)
	tar -c --xz -f $(NAME).tar.xz $(NAME)
	rm -rf $(NAME)
