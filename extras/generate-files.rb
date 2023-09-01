# dnf install rubygem-i18n html2text wget
require "i18n"

WNAME = 'f39'
WNAME_FULL = 'F39'
WVERSION = '39.0'

# load authors' info from prepared file
authors = {}
file = File.new("authors.list", "r")
while (line = file.gets)
  tmp = line.chomp.split(", ")
  authors[tmp[0]] = tmp[1]
end
file.close

# load themes' info from prepared file
theme = {}
licences = {}
themes = []

I18n.config.available_locales = :en
file = File.new("themes.list", "r")
while (line = file.gets)
  tmp = line.chomp.sub(/ by /,', ').split(", ")
  theme[:name] = tmp[0]
  theme[:filename] = I18n.transliterate(tmp[0].downcase.gsub(' ','-'))
  theme[:author] = tmp[1]
  theme[:fas] = authors[theme[:author]]
  theme[:mail] = "#{theme[:fas]} AT fedoraproject DOT org"
  theme[:licence] = tmp[2]
  if (theme[:licence] == "Free Art")
    licence = theme[:licence].sub('Free Art','licence/lal').split(' ').join('/').downcase
    url = "http://artlibre.org/#{licence}/en/"
  else
    licence = theme[:licence].sub('CC0','publicdomain/zero').sub('CC-','licences/').split(' ').join('/').downcase
    url = "http://creativecommons.org/#{licence}/legalcode"
  end
  licences[theme[:licence]] = url
  theme[:ext] = tmp[3]
  theme[:filename] << ".#{theme[:ext]}"
  themes << theme.dup
end
file.close

# generate licence files
licences.each do |name, url|
  filename = name.sub(' ','-')
  if filename == 'Free-Art'
    unless File.exists?("../#{filename}")
      cmd = "wget #{url}"
      system(cmd)    
      cmd = "mv en '#{filename}.html'"
      system(cmd)
      cmd = "html2text -utf8 '#{filename}.html' >> '../#{filename}' && rm -f '#{filename}.html'"
      system(cmd)
     end
  else
    unless File.exists?("../#{filename}")
      cmd = "wget #{url}"
      system(cmd)    
      cmd = "mv legalcode '#{filename}.html'"
      system(cmd)
      cmd = "html2text -utf8 '#{filename}.html' >> '../#{filename}' && rm -f '#{filename}.html'"
      system(cmd)
     end
  end
end

# generate attribution, xmls and .desktops
f_attribution = File.new('../Attribution-Extras', 'w')

f_slideshow_xml = File.new("#{WNAME}-extras.xml", 'w')
f_slideshow_xml.puts <<EOF
<background>
  <starttime>
    <year>2023</year>
    <month>09</month>
    <day>01</day>
    <hour>07</hour>
    <minute>00</minute>
    <second>00</second>
  </starttime>

EOF
f_gnome_xml = File.new("gnome-backgrounds-#{WNAME}-extras.xml", 'w')
f_gnome_xml.puts <<-EOF
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE wallpapers SYSTEM "gnome-wp-list.dtd">
<wallpapers>
EOF

f_mate_xml = File.new("mate-backgrounds-#{WNAME}-extras.xml", 'w')
f_mate_xml.puts <<-EOF
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE wallpapers SYSTEM "mate-wp-list.dtd">
<wallpapers>
EOF

wallpaper = <<-EOF
    <wallpaper deleted="false">
        <name>#{WNAME_FULL} Supplemental Wallpapers Slideshow</name>
        <filename>/usr/share/backgrounds/#{WNAME}/extras/#{WNAME}-extras.xml</filename>
        <options>scaled</options>
    </wallpaper>

EOF

f_gnome_xml.puts wallpaper
f_mate_xml.puts wallpaper

themes.each do |theme|
  heading = "**** #{theme[:name]} ****"
  filename = "/usr/share/backgrounds/#{WNAME}/extras/#{theme[:filename]}"
  f_attribution.puts <<-EOF
#{heading}
#{heading.gsub(/.?/,'=').chop}
File:    #{filename}
Author:  #{theme[:author]}
Contact: #{theme[:mail]}
Licence: #{theme[:licence]}

  EOF

  f_slideshow_xml.puts <<-EOF
  <static>
    <duration>1800.0</duration>
    <file>#{filename}</file>
  </static>

  EOF

  wallpaper = <<-EOF
    <wallpaper deleted="false">
        <name>#{theme[:name]} (#{WNAME_FULL} Supplemental)</name>
        <filename>#{filename}</filename>
        <options>scaled</options>
    </wallpaper>

  EOF
  f_gnome_xml.puts wallpaper
  f_mate_xml.puts wallpaper

  f_desktop = File.new("#{theme[:filename].gsub(/\..*/,".desktop")}", "w")
  f_desktop.puts <<-EOF
[Desktop Entry]
Name=#{theme[:name]} (#{WNAME_FULL} Supplemental)

X-KDE-PluginInfo-Name=#{theme[:name]} (#{WNAME_FULL} Supplemental)
X-KDE-PluginInfo-Author=#{theme[:author]}
X-KDE-PluginInfo-Email=fedora-design@lists.fedoraproject.org
X-KDE-PluginInfo-Name=#{WNAME_FULL}
X-KDE-PluginInfo-Version=#{WVERSION}
X-KDE-PluginInfo-Website=https://fedoraproject.org/wiki/Design
X-KDE-PluginInfo-Category=
X-KDE-PluginInfo-Depends=
X-KDE-PluginInfo-License=#{theme[:licence]}
X-KDE-PluginInfo-EnabledByDefault=true
X-Plasma-API=5.0

[Settings]
FallbackTheme=default

[Wallpaper]
defaultWallpaperTheme=#{WNAME_FULL}
defaultFileSuffix=.png
defaultWidth=1920
defaultHeight=1200

[Branding]
homepage=https://fedoraproject.org
  EOF
  f_desktop.close
end

f_mate_xml.puts "</wallpapers>"
f_gnome_xml.puts "</wallpapers>"
f_mate_xml.close
f_gnome_xml.close

f_slideshow_xml.puts "</background>"
f_slideshow_xml.close

f_attribution.close

def prepare_image(orig, new)
  if File.exists?(orig)
    system "mv '#{orig}' '#{new}'"
  elsif !File.exists?(new)
    puts "Could not find image #{orig} or #{new}!"
  end
end

if File.exists?('img-orig')
  themes.each do |theme|
    prepare_image("img-orig/#{theme[:name]}.#{theme[:ext]}",theme[:filename])
  end
  system('rm -rf img-orig')
end

f_makefile = File.new("Makefile", 'w')

f_makefile.puts <<-EOF
#{WNAME_FULL}_DIR=$(DESTDIR)/usr/share/backgrounds/#{WNAME}
GNOME_BG_DIR=$(DESTDIR)/usr/share/gnome-background-properties
MATE_BG_DIR=$(DESTDIR)/usr/share/mate-background-properties
KDE_BG_DIR=$(DESTDIR)/usr/share/wallpapers/
XFCE_BG_DIR=$(DESTDIR)/usr/share/xfce4/backdrops
MKDIR=/bin/mkdir -p
INSTALL=/usr/bin/install -p -m644 -D
LN_S=/bin/ln -s

EOF

themes_jpg = []
themes_png = []
themes.each do |theme|
  if theme[:ext] == "jpg"
    themes_jpg += [theme[:name].downcase.gsub(' ','-')]
  else
    themes_png += [theme[:name].downcase.gsub(' ','-')]
  end
end

f_makefile.puts "THEMES_JPG=" << themes_jpg.join("\\\n\t")
f_makefile.puts "THEMES_PNG=" << themes_png.join("\\\n\t")

f_makefile.puts <<-EOF

all:

install:
	$(MKDIR) $(#{WNAME_FULL}_DIR)/extras
	$(MKDIR) $(GNOME_BG_DIR)
	$(MKDIR) $(MATE_BG_DIR)
	$(MKDIR) $(XFCE_BG_DIR)
	$(INSTALL) #{WNAME}-extras.xml 				$(#{WNAME_FULL}_DIR)/extras/#{WNAME}-extras.xml
	$(INSTALL) gnome-backgrounds-#{WNAME}-extras.xml 	$(GNOME_BG_DIR)/#{WNAME}-extras.xml
	$(INSTALL) mate-backgrounds-#{WNAME}-extras.xml 	$(MATE_BG_DIR)/#{WNAME}-extras.xml
	for theme in $(THEMES_JPG) ; do \\
	  $(INSTALL) $${theme}.jpg $(#{WNAME_FULL}_DIR)/extras/$${theme}.jpg ;\\
	  $(MKDIR) $(KDE_BG_DIR)/#{WNAME_FULL}_$${theme}/contents/images ;\\
	  $(INSTALL) $${theme}.desktop $(KDE_BG_DIR)/#{WNAME_FULL}_$${theme}/metadata.desktop ; \\
	  for res in 1280x1024 \\
		     640x480 800x600 1024x768 1152x864 1200x900 1280x960 1440x1080 1600x1200 1600x1280 1920x1440 2048x1536 \\
		     800x480 1024x600 1152x720 1280x720 1280x768 1280x800 1366x768 1440x900 1680x1050 1920x1080 1920x1200 \\
		     2160x1440 2304x1440 2560x1440 2560x1600 2960x1440 3000x2000 3200x1800  3440x1440 3840x2160; do \\
	    $(LN_S) ../../../../backgrounds/#{WNAME}/extras/$${theme}.jpg \\
	            $(KDE_BG_DIR)/#{WNAME_FULL}_$${theme}/contents/images/$${res}.jpg ; \\
	  done; \\
	  $(LN_S) ../../backgrounds/#{WNAME}/extras/$${theme}.jpg \\
			$(XFCE_BG_DIR)/#{WNAME}-$${theme}.jpg ;\\
	done;
	for theme in $(THEMES_PNG) ; do \\
	  $(INSTALL) $${theme}.png $(#{WNAME_FULL}_DIR)/extras/$${theme}.png ;\\
	  $(MKDIR) $(KDE_BG_DIR)/#{WNAME_FULL}_$${theme}/contents/images ;\\
	  $(INSTALL) $${theme}.desktop $(KDE_BG_DIR)/#{WNAME_FULL}_$${theme}/metadata.desktop ; \\
	  for res in 1280x1024 \\
		     640x480 800x600 1024x768 1152x864 1200x900 1280x960 1440x1080 1600x1200 1600x1280 1920x1440 2048x1536 \\
		     800x480 1024x600 1152x720 1280x720 1280x768 1280x800 1366x768 1440x900 1680x1050 1920x1080 1920x1200 \\
		     2160x1440 2304x1440 2560x1440 2560x1600 2960x1440 3000x2000 3200x1800  3440x1440 3840x2160; do \\
	    $(LN_S) ../../../../backgrounds/#{WNAME}/extras/$${theme}.png \\
	            $(KDE_BG_DIR)/#{WNAME_FULL}_$${theme}/contents/images/$${res}.png ; \\
	  done; \\
	  $(LN_S) ../../backgrounds/#{WNAME}/extras/$${theme}.png \\
			$(XFCE_BG_DIR)/#{WNAME}-$${theme}.png ;\\
	done;

EOF

f_makefile.close

puts "Task Done"
