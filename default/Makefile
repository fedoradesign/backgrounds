WP_NAME=f32
WP_BIGNAME=F32
WP_DIR=$(DESTDIR)/usr/share/backgrounds/$(WP_NAME)
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
	#~ GNOME background
	$(MKDIR) $(GNOME_BG_DIR)
	#~ $(INSTALL) $(WP_NAME).png $(WP_DIR)/default/$(WP_NAME).png \
	#~ $(INSTALL) $(WP_NAME)-02-day.png		    $(WP_DIR)/default/$(WP_NAME).png ; \
	for tod in 01-dawn 02-day 03-dusk 04-twilight; do \
	   $(INSTALL) $(WP_NAME)-$${tod}.png	$(WP_DIR)/default/$(WP_NAME)-$${tod}.png ; \
	done; 
	$(CP) $(WP_DIR)/default/$(WP_NAME)-02-day.png	$(WP_DIR)/default/$(WP_NAME).png 
	$(INSTALL) $(WP_NAME).xml  $(WP_DIR)/default/$(WP_NAME).xml
	$(INSTALL) gnome-backgrounds-$(WP_NAME).xml	$(GNOME_BG_DIR)/$(WP_NAME).xml
	$(INSTALL) $(WP_NAME)-animated.xml     $(WP_DIR)/default/$(WP_NAME)-animated.xml
	$(INSTALL) gnome-backgrounds-$(WP_NAME)-animated.xml 		$(GNOME_BG_DIR)/$(WP_NAME)-animated.xml
	
	#~ KDE and Plasma background
	$(MKDIR) $(KDE_BG_DIR)/$(WP_BIGNAME)/contents/images
	$(INSTALL) $(WP_NAME)-metadata.desktop $(KDE_BG_DIR)/$(WP_BIGNAME)/metadata.desktop
	$(CP) $(WP_DIR)/default/$(WP_NAME).png \
	          $(KDE_BG_DIR)/$(WP_BIGNAME)/contents/images/
	$(MKDIR) $(PLASMA_BG_DIR)/$(WP_BIGNAME)
	$(INSTALL) $(WP_NAME)-metadata.desktop	$(PLASMA_BG_DIR)/$(WP_BIGNAME)/metadata.desktop
	
	#~ MATE background
	$(MKDIR) $(MATE_BG_DIR)
	$(MKDIR) $(MATE_BG_DEFAULT)
	$(INSTALL) mate-backgrounds-$(WP_NAME).xml 		$(MATE_BG_DIR)/$(WP_NAME).xml
	$(CP)  $(WP_DIR)/default/$(WP_NAME).xml $(MATE_BG_DEFAULT)/default.xml
	$(INSTALL) mate-backgrounds-$(WP_NAME)-animated.xml 		$(MATE_BG_DIR)/$(WP_NAME)-animated.xml
	
	#~ XFCE background
	$(MKDIR) $(XFCE_BG_DIR)
	$(CP) $(WP_DIR)/default/$(WP_NAME)-02-day.png \
			$(XFCE_BG_DIR)/$(WP_NAME).png
	for tod in 01-dawn 03-dusk 04-twilight; do \
	   $(CP) $(WP_DIR)/default/$(WP_NAME)-$${tod}.png $(XFCE_BG_DIR)/$(WP_NAME)-$${tod}.png; \
	done;
