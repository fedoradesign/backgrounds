%global relnum 41
%global Bg_Name F41
%global bgname %(t="%{Bg_Name}";echo ${t,,})

# Disable Extras subpackages
%global with_extras 0

Name:           %{bgname}-backgrounds
Version:        %{relnum}.0.0
Release:        %autorelease
Summary:        Fedora %{relnum} default desktop background

License:        CC-BY-SA-4.0
URL:            https://fedoraproject.org/wiki/_Artwork
Source0:        https://github.com/fedoradesign/backgrounds/releases/download/v%{version}/%{name}-%{version}.tar.xz


BuildArch:      noarch

BuildRequires:  kde-filesystem
BuildRequires:  make

Requires:       %{name}-budgie = %{version}-%{release}
Requires:       %{name}-gnome = %{version}-%{release}
Requires:       %{name}-kde = %{version}-%{release}
Requires:       %{name}-xfce = %{version}-%{release}
Requires:       %{name}-mate = %{version}-%{release}


%description
This package contains desktop backgrounds for the Fedora  %{relnum} default
theme.  Pulls in themes for GNOME, KDE, Mate and Xfce desktops.

%package        base
Summary:        Base images for Fedora  %{relnum} default background
License:        CC-BY-SA-4.0

%description    base
This package contains base images for Fedora  %{relnum} default background.

%package        budgie
Summary:        Fedora  %{relnum} default wallpaper for Budgie
Requires:       %{name}-base = %{version}-%{release}
Recommends:	%{name}-gnome = %{version}-%{release}

%description    budgie
This package contains Budgie desktop wallpaper for the
Fedora  %{relnum} default theme.

%package        gnome
Summary:        Fedora  %{relnum} default wallpaper for Gnome and Cinnamon
Requires:       %{name}-base = %{version}-%{release}

%description    gnome
This package contains Gnome/Cinnamon desktop wallpaper for the
Fedora  %{relnum} default theme.

%package        kde
Summary:        Fedora  %{relnum} default wallpaper for KDE
Requires:       %{name}-base = %{version}-%{release}
Requires:       kde-filesystem

%description    kde
This package contains KDE desktop wallpaper for the Fedora  %{relnum}
default them

%package        mate
Summary:        Fedora %{relnum} default wallpaper for Mate
Requires:       %{name}-base = %{version}-%{release}

%description    mate
This package contains Mate desktop wallpaper for the Fedora  %{relnum}
default theme.

%package        xfce
Summary:        Fedora  %{relnum} default background for XFCE4

Requires:       %{name}-base = %{version}-%{release}
Requires:       xfdesktop

%description    xfce
This package contains XFCE4 desktop background for the Fedora  %{relnum}
default theme.

%if %{with_extras}
%package        extras-base
Summary:        Base images for  Extras Backgrounds
License:        CC-BY-4.0 AND CC-BY-SA-4.0 AND CC0-1.0

%description    extras-base
This package contains base images for  supplemental
wallpapers.

%package        extras-gnome
Summary:        Extra  Wallpapers for Gnome and Cinnamon

Requires:       %{name}-extras-base = %{version}-%{release}

%description    extras-gnome
This package contains  supplemental wallpapers for Gnome
and Cinnamon

%package        extras-mate
Summary:        Extra  Wallpapers for Mate

Requires:       %{name}-extras-base = %{version}-%{release}

%description    extras-mate
This package contains  supplemental wallpapers for Mate

%package        extras-kde
Summary:        Extra  Wallpapers for KDE

Requires:       %{name}-extras-base = %{version}-%{release}

%description    extras-kde
This package contains  supplemental wallpapers for Gnome

%package        extras-xfce
Summary:        Extra  Wallpapers for XFCE

Requires:       %{name}-extras-base = %{version}-%{release}

%description    extras-xfce
This package contains  supplemental wallpapers for XFCE
%endif

%prep
%autosetup -n %{name}


%build
%make_build


%install
%make_install

%files
%doc

%files base
%license COPYING Attribution
%dir %{_datadir}/backgrounds/%{bgname}
%dir %{_datadir}/backgrounds/%{bgname}/default
%{_datadir}/backgrounds/%{bgname}/default/%{bgname}*.{png,xml}

%files kde
%{_datadir}/wallpapers/%{Bg_Name}/

%files gnome
%{_datadir}/gnome-background-properties/%{bgname}.xml
%dir %{_datadir}/gnome-background-properties/

%files budgie
%{_datadir}/gnome-background-properties/%{bgname}-budgie.xml

%files mate
%{_datadir}/mate-background-properties/%{bgname}.xml
%dir %{_datadir}/mate-background-properties/

%files xfce
%{_datadir}/xfce4/backdrops/%{bgname}.png
%dir %{_datadir}/xfce4/
%dir %{_datadir}/xfce4/backdrops/

%if %{with_extras}
%files extras-base
%license COPYING
%{_datadir}/backgrounds/%{bgname}/extras/

%files extras-gnome
%{_datadir}/gnome-background-properties/%{bgname}-extras.xml

%files extras-kde
%{_datadir}/wallpapers/%{Bg_Name}_*/

%files extras-mate
%{_datadir}/mate-background-properties/%{bgname}-extras.xml

%files extras-xfce
%{_datadir}/xfce4/backdrops/
%endif

%changelog
%autochangelog
