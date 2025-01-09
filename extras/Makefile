WP_BG_DIR=$(WP_BG_ROOT)/extras
WP_BG_REL=$(WP_REL_PATH)/extras

THEMES_JPG=
THEMES_PNG= \
	01-dark-blue \
	01-light-blue

WP_PNG_DESTS=$(THEMES_PNG:%=$(WP_BG_DIR)/%.png)

INSTALL_RULES= \
	install-base \
	install-gnome \
	install-kde \
	install-mate \
	install-xfce

.PHONY: $(WP_PNG_DESTS) $(INSTALL_RULES) all install

$(WP_PNG_DESTS): OUTNAME = $(shell $(BASENAME) $@)
$(WP_PNG_DESTS):
	$(MKDIR) $(WP_BG_DIR)
	#~ Convert to RGB-format file (no alpha) and fix timestamp
	$(MAGICK) $(OUTNAME) -alpha off $@ 
	$(TOUCH_R) $(OUTNAME) $@

all:

install: $(INSTALL_RULES)

install-base: $(WP_PNG_DESTS)
	$(MKDIR) $(WP_BG_DIR)
	$(INSTALL) f41-extras.xml $(WP_BG_DIR)/f41-extras.xml
	for theme in $(THEMES_JPG); do \
	  $(INSTALL) $${theme}.jpg $(WP_BG_DIR)/$${theme}.jpg; \
	done
	#~ Base background PNG images done by WP_PNG_DESTS rules

install-gnome:
	$(MKDIR) $(GNOME_BG_DIR)
	$(INSTALL) gnome-backgrounds-f41-extras.xml $(GNOME_BG_DIR)/f41-extras.xml

install-mate:
	$(MKDIR) $(MATE_BG_DIR)
	$(INSTALL) mate-backgrounds-f41-extras.xml $(MATE_BG_DIR)/f41-extras.xml

install-xfce:
	$(MKDIR) $(XFCE_BG_DIR)
	for theme in $(THEMES_JPG); do \
	  $(LN_S) ../../$(WP_BG_REL)/$${theme}.jpg \
			$(XFCE_BG_DIR)/f41-$${theme}.jpg ;\
	done
	for theme in $(THEMES_PNG); do \
	  $(LN_S) ../../$(WP_BG_REL)/$${theme}.png \
			$(XFCE_BG_DIR)/f41-$${theme}.png ; \
	done

install-kde:
	for theme in $(THEMES_JPG) ; do \
	  $(MKDIR) $(KDE_BG_ROOT)/F41_$${theme}/contents/images ;\
	  $(INSTALL) $${theme}.desktop $(KDE_BG_ROOT)/F41_$${theme}/metadata.desktop ; \
	  for res in $(RESOLUTIONS); do \
	    $(LN_S) ../../../../$(WP_BG_REL)/$${theme}.jpg \
	      $(KDE_BG_ROOT)/F41_$${theme}/contents/images/$${res}.jpg ; \
	  done; \
	done;
	for theme in $(THEMES_PNG) ; do \
	  $(MKDIR) $(KDE_BG_ROOT)/F41_$${theme}/contents/images ;\
	  $(INSTALL) $${theme}.desktop $(KDE_BG_ROOT)/F41_$${theme}/metadata.desktop ; \
	  for res in $(RESOLUTIONS); do \
	    $(LN_S) ../../../../$(WP_BG_REL)/$${theme}.png \
	      $(KDE_BG_ROOT)/F41_$${theme}/contents/images/$${res}.png ; \
	  done; \
	done;
