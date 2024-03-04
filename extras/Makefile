F40_DIR=$(DESTDIR)/usr/share/backgrounds/f40
GNOME_BG_DIR=$(DESTDIR)/usr/share/gnome-background-properties
MATE_BG_DIR=$(DESTDIR)/usr/share/mate-background-properties
KDE_BG_DIR=$(DESTDIR)/usr/share/wallpapers/
XFCE_BG_DIR=$(DESTDIR)/usr/share/xfce4/backdrops
MKDIR=/bin/mkdir -p
PNGQUANT=/usr/bin/pngquant
INSTALL=/usr/bin/install -p -m644 -D
LN_S=/bin/ln -s

THEMES_JPG=
THEMES_PNG=01-dark-blue\
	01-light-blue

all:

install:
	$(MKDIR) $(F40_DIR)/extras
	$(MKDIR) $(GNOME_BG_DIR)
	$(MKDIR) $(MATE_BG_DIR)
	$(MKDIR) $(XFCE_BG_DIR)
	$(INSTALL) f40-extras.xml 				$(F40_DIR)/extras/f40-extras.xml
	$(INSTALL) gnome-backgrounds-f40-extras.xml 	$(GNOME_BG_DIR)/f40-extras.xml
	$(INSTALL) mate-backgrounds-f40-extras.xml 	$(MATE_BG_DIR)/f40-extras.xml
	for theme in $(THEMES_JPG) ; do \
	  $(INSTALL) $${theme}.jpg $(F40_DIR)/extras/$${theme}.jpg ;\
	  $(MKDIR) $(KDE_BG_DIR)/F40_$${theme}/contents/images ;\
	  $(INSTALL) $${theme}.desktop $(KDE_BG_DIR)/F40_$${theme}/metadata.desktop ; \
	  for res in 1280x1024 \
		     640x480 800x600 1024x768 1152x864 1200x900 1280x960 1440x1080 1600x1200 1600x1280 1920x1440 2048x1536 \
		     800x480 1024x600 1152x720 1280x720 1280x768 1280x800 1366x768 1440x900 1680x1050 1920x1080 1920x1200 \
		     2160x1440 2304x1440 2560x1440 2560x1600 2960x1440 3000x2000 3200x1800  3440x1440 3840x2160; do \
	    $(LN_S) ../../../../backgrounds/f40/extras/$${theme}.jpg \
	            $(KDE_BG_DIR)/F40_$${theme}/contents/images/$${res}.jpg ; \
	  done; \
	  $(LN_S) ../../backgrounds/f40/extras/$${theme}.jpg \
			$(XFCE_BG_DIR)/f40-$${theme}.jpg ;\
	done;
	#~ Compress to 8-bit png format
	for theme in $(THEMES_PNG) ; do \
	  $(INSTALL) $${theme}.png     $(F40_DIR)/extras/$${theme}.png ; \
	  $(MKDIR) $(KDE_BG_DIR)/F40_$${theme}/contents/images ;\
	  $(INSTALL) $${theme}.desktop $(KDE_BG_DIR)/F40_$${theme}/metadata.desktop ; \
	  for res in 1280x1024 \
		     640x480 800x600 1024x768 1152x864 1200x900 1280x960 1440x1080 1600x1200 1600x1280 1920x1440 2048x1536 \
		     800x480 1024x600 1152x720 1280x720 1280x768 1280x800 1366x768 1440x900 1680x1050 1920x1080 1920x1200 \
		     2160x1440 2304x1440 2560x1440 2560x1600 2960x1440 3000x2000 3200x1800  3440x1440 3840x2160; do \
	    $(LN_S) ../../../../backgrounds/f40/extras/$${theme}.png \
	            $(KDE_BG_DIR)/F40_$${theme}/contents/images/$${res}.png ; \
	  done; \
	  $(LN_S) ../../backgrounds/f40/extras/$${theme}.png \
			$(XFCE_BG_DIR)/f40-$${theme}.png ;\
	done;

