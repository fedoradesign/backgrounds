WP_NAME=f40
WP_BIGNAME=F40
WP_DIR=$(DESTDIR)/usr/share/backgrounds/$(WP_NAME)
WP_DIR_LN=/usr/share/backgrounds/$(WP_NAME)
GNOME_BG_DIR=$(DESTDIR)/usr/share/gnome-background-properties
KDE_BG_DIR=$(DESTDIR)/usr/share/wallpapers
MATE_BG_DIR=$(DESTDIR)/usr/share/mate-background-properties
MATE_BG_DEFAULT=$(DESTDIR)/usr/share/backgrounds/mate
PLASMA_BG_DIR=$(DESTDIR)/usr/share/plasma/desktoptheme
XFCE_BG_DIR=$(DESTDIR)/usr/share/xfce4/backdrops
INKSCAPE=/usr/bin/inkscape
MKDIR=/bin/mkdir -p
INSTALL=/usr/bin/install -p -m644 -D
LN_S=/bin/ln -s
CP=/bin/cp -p

all:

install:
	$(MKDIR) $(WP_DIR)/default
	$(INSTALL) $(WP_NAME).xml	$(WP_DIR)/default/$(WP_NAME).xml
	#~ Base background
	for tod in 01-day 01-night; do \
	  $(INSTALL) $(WP_NAME)-$${tod}.png	$(WP_DIR)/default/$(WP_NAME)-$${tod}.png ; \
	done;
	
	#~ GNOME background
	$(MKDIR) $(GNOME_BG_DIR)
	$(INSTALL) gnome-backgrounds-$(WP_NAME).xml	$(GNOME_BG_DIR)/$(WP_NAME).xml
	#~ Budgie background
	$(INSTALL) budgie-backgrounds-$(WP_NAME).xml	$(GNOME_BG_DIR)/$(WP_NAME)-budgie.xml
	
	#~ KDE and Plasma background
	$(MKDIR) $(KDE_BG_DIR)/$(WP_BIGNAME)/contents/images
	$(MKDIR) $(KDE_BG_DIR)/$(WP_BIGNAME)/contents/images_dark
	$(INSTALL) $(WP_NAME)-metadata.json $(KDE_BG_DIR)/$(WP_BIGNAME)/metadata.json
	for res in 1280x1024 \
		     640x480 800x600 1024x768 1152x864 1200x900 1280x960 1440x1080 1600x1200 1600x1280 1920x1440 2048x1536 \
		     800x480 1024x600 1152x720 1280x720 1280x768 1280x800 1366x768 1440x900 1680x1050 1920x1080 1920x1200 1920x1280 \
		     2160x1440 2304x1440 2560x1440 2560x1600 2960x1440 3000x2000 3200x1800  3440x1440 3840x2160; do \
	  $(LN_S) ../../../../backgrounds/$(WP_NAME)/default/$(WP_NAME)-01-day.png \
	          $(KDE_BG_DIR)/$(WP_BIGNAME)/contents/images/$${res}.png ; \
	  $(LN_S) ../../../../backgrounds/$(WP_NAME)/default/$(WP_NAME)-01-night.png \
	          $(KDE_BG_DIR)/$(WP_BIGNAME)/contents/images_dark/$${res}.png ; \
	done;
	
	#~ MATE background
	$(MKDIR) $(MATE_BG_DIR)
	$(INSTALL) mate-backgrounds-$(WP_NAME).xml $(MATE_BG_DIR)/$(WP_NAME).xml
	
	#~ XFCE background
	$(MKDIR) $(XFCE_BG_DIR)
	$(LN_S) $(WP_DIR_LN)/default/$(WP_NAME)-01-day.png \
			$(XFCE_BG_DIR)/$(WP_NAME).png
	$(LN_S) $(WP_DIR_LN)/default/$(WP_NAME)-01-night.png \
			$(XFCE_BG_DIR)/$(WP_NAME)-01-night.png
