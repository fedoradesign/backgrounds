WP_BG_DIR=$(WP_BG_ROOT)/default
WP_BG_REL=$(WP_REL_PATH)/default
KDE_BG_DIR=$(KDE_BG_ROOT)/$(WP_BIGNAME)

THEMES_JXL= \
	$(WP_NAME)-01-day.jxl \
	$(WP_NAME)-01-night.jxl

WP_JXL_DESTS=$(THEMES_JXL:%=$(WP_BG_DIR)/%)
XFCE_JXL_DESTS=$(THEMES_JXL:%=$(XFCE_BG_DIR)/%)

INSTALL_RULES= \
	install-base \
	install-gnome \
	install-budgie \
	install-kde \
	install-mate \
	install-xfce

.PHONY: $(WP_JXL_DESTS) $(XFCE_JXL_DESTS) $(INSTALL_RULES) \
        all install

$(WP_JXL_DESTS): OUTNAME = $(shell $(BASENAME) $@)
$(WP_JXL_DESTS):
	$(MKDIR) $(WP_BG_DIR)
	#~ Convert to RGB-format file (no alpha) and fix timestamp
	$(MAGICK) $(OUTNAME) -alpha off $@ 
	$(TOUCH_R) $(OUTNAME) $@

$(XFCE_JXL_DESTS): OUTNAME = $(shell $(BASENAME) $@)
$(XFCE_JXL_DESTS):
	$(MKDIR) $(XFCE_BG_DIR)
	#~ Convert to RGB-format file (no alpha) and fix timestamp
	$(MAGICK) $(OUTNAME) -alpha off $@
	$(TOUCH_R) $(OUTNAME) $@

all:

install: $(INSTALL_RULES)

install-base: $(WP_JXL_DESTS)
	$(MKDIR) $(WP_BG_DIR)
	$(INSTALL) $(WP_NAME).xml	$(WP_BG_DIR)/$(WP_NAME).xml
	#~ Base background images done by WP_JXL_DESTS rules

install-gnome:	
	#~ GNOME background
	$(MKDIR) $(GNOME_BG_DIR)
	$(INSTALL) gnome-backgrounds-$(WP_NAME).xml	$(GNOME_BG_DIR)/$(WP_NAME).xml

install-budgie:
	#~ Budgie background
	$(INSTALL) budgie-backgrounds-$(WP_NAME).xml	$(GNOME_BG_DIR)/$(WP_NAME)-budgie.xml

install-kde:	
	#~ KDE and Plasma background
	$(MKDIR) $(KDE_BG_DIR)/contents/images
	$(MKDIR) $(KDE_BG_DIR)/contents/images_dark
	$(INSTALL) $(WP_NAME)-metadata.json $(KDE_BG_DIR)/metadata.json
	for res in $(RESOLUTIONS); do \
	  $(LN_S) ../../../../$(WP_BG_REL)/$(WP_NAME)-01-day.jxl \
	          $(KDE_BG_DIR)/contents/images/$${res}.jxl ; \
	  $(LN_S) ../../../../$(WP_BG_REL)/$(WP_NAME)-01-night.jxl \
	          $(KDE_BG_DIR)/contents/images_dark/$${res}.jxl ; \
	done;
	
install-mate:
	#~ MATE background
	$(MKDIR) $(MATE_BG_DIR)
	$(INSTALL) mate-backgrounds-$(WP_NAME).xml $(MATE_BG_DIR)/$(WP_NAME).xml

install-xfce: $(XFCE_JXL_DESTS)
	#~ XFCE background images done by XFCE_JXL_DESTS rules
	#~ XFCE background
	$(MKDIR) $(XFCE_BG_DIR)
	$(INSTALL) $(WP_NAME)-01-day.jxl \
			$(XFCE_BG_DIR)/$(WP_NAME).jxl
	$(INSTALL) $(WP_NAME)-01-night.jxl \
			$(XFCE_BG_DIR)/$(WP_NAME)-01-night.jxl
