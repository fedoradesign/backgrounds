%global relnum 32
%global Bg_Name F%{relnum}
%global bgname %(t="%{Bg_Name}";echo ${t,,})

# Enable Animation
%global with_animated 1

# Enable Extras
%global with_extras 1

Name:		%{bgname}-backgrounds
Version:	%{relnum}.1.4
Release:	1%{?dist}
Summary:	Fedora %{relnum} default desktop background

License:	CC-BY-SA
URL:		https://fedoraproject.org/wiki/F%{relnum}_Artwork
Source0:	https://github.com/fedoradesign/backgrounds/releases/download/v%{version}/%{name}-%{version}.tar.xz

BuildArch:	noarch

# for %%_kde4_* macros
BuildRequires:	kde-filesystem

Requires:	%{name}-gnome = %{version}-%{release}
Requires:	%{name}-kde = %{version}-%{release}
Requires:	%{name}-xfce = %{version}-%{release}
Requires:	%{name}-mate = %{version}-%{release}


%description
This package contains desktop backgrounds for the Fedora %{relnum} default
theme.  Pulls in themes for GNOME, KDE, Mate and Xfce desktops.

%package	base
Summary:	Base images for Fedora %{relnum} default background
License:	CC-BY-SA

%description	base
This package contains base images for Fedora %{relnum} default background.

%if %{with_animated}
%package	animated
Summary:	Time of day images for Fedora %{relnum} backgrounds

Requires:	%{name}-base = %{version}-%{release}

%description	animated
This package contains the time of day images for Fedora %{relnum} 
Backgrounds.
%endif

%package	kde
Summary:	Fedora %{relnum} default wallpaper for KDE

Requires:	%{name}-base = %{version}-%{release}
Requires:	kde-filesystem

%description    kde
This package contains KDE desktop wallpaper for the Fedora %{relnum}
default theme

%package	gnome
Summary:	Fedora %{relnum} default wallpaper for GNOME and Cinnamon

Requires:	%{name}-base = %{version}-%{release}
Recommends:	%{name}-animated = %{version}-%{release}

%description	gnome
This package contains GNOME/Cinnamon desktop wallpaper for the
Fedora %{relnum} default theme.

%package	mate
Summary:	Fedora %{relnum} default wallpaper for Mate

Requires:	%{name}-base = %{version}-%{release}
Recommends:	%{name}-animated = %{version}-%{release}

%description	mate
This package contains Mate desktop wallpaper for the Fedora %{relnum}
default theme.

%package	xfce
Summary:	Fedora %{relnum} default background for XFCE4

Requires:	%{name}-base = %{version}-%{release}
Requires:	xfdesktop

%description	xfce
This package contains XFCE4 desktop background for the Fedora %{relnum}
default theme.

%if %{with_extras}
%package	extras-base
Summary:	Base images for F%{relnum} Extras Backrounds
License:	CC-BY and CC-BY-SA

%description	extras-base
This package contains base images for F%{relnum} supplemental
wallpapers.

%package	extras-gnome
Summary:	Extra F%{relnum} Wallpapers for GNOME and Cinnamon

Requires:	%{name}-extras-base = %{version}-%{release}

%description	extras-gnome
This package contains F%{relnum} supplemental wallpapers for GNOME
and Cinnamon

%package	extras-mate
Summary:	Extra F%{relnum} Wallpapers for Mate

Requires:	%{name}-extras-base = %{version}-%{release}

%description    extras-mate
This package contains F%{relnum} supplemental wallpapers for Mate

%package	extras-kde
Summary:	Extra F%{relnum} Wallpapers for KDE

Requires:	%{name}-extras-base = %{version}-%{release}

%description	extras-kde
This package contains F%{relnum} supplemental wallpapers for KDE

%package	extras-xfce
Summary:	Extra F%{relnum} Wallpapers for XFCE

Requires:	%{name}-extras-base = %{version}-%{release}

%description	extras-xfce
This package contains F%{relnum} supplemental wallpapers for XFCE
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
%license CC-BY-SA-4.0 Attribution
%dir %{_datadir}/backgrounds/%{bgname}
%dir %{_datadir}/backgrounds/%{bgname}/default
%{_datadir}/backgrounds/%{bgname}/default/%{bgname}.*
%{_datadir}/backgrounds/%{bgname}/default/%{bgname}-static.xml
%if %{with_animated}
%files animated
%{_datadir}/backgrounds/%{bgname}/default/%{bgname}-animated.xml
%{_datadir}/backgrounds/%{bgname}/default/%{bgname}-*.png
%endif

%files kde
%{_kde4_datadir}/wallpapers/%{Bg_Name}/
%dir %{_datadir}/plasma/
%dir %{_datadir}/plasma/desktoptheme/
%{_datadir}/plasma/desktoptheme/%{Bg_Name}/

%files gnome
%{_datadir}/gnome-background-properties/%{bgname}.xml
%if %{with_animated}
%{_datadir}/gnome-background-properties/%{bgname}-animated.xml
%endif
%dir %{_datadir}/gnome-background-properties/

%files mate
%{_datadir}/backgrounds/mate/default.xml
%{_datadir}/mate-background-properties/%{bgname}.xml
%if %{with_animated}
%{_datadir}/mate-background-properties/%{bgname}-animated.xml
%endif
%dir %{_datadir}/mate-background-properties/

%files xfce
%{_datadir}/xfce4/backdrops/%{bgname}.png
%if %{with_animated}
%{_datadir}/xfce4/backdrops/%{bgname}-0*.png
%endif
%dir %{_datadir}/xfce4/
%dir %{_datadir}/xfce4/backdrops/

%if %{with_extras}
%files extras-base
%license CC-BY-SA-4.0 Attribution-Extras
%{_datadir}/backgrounds/%{bgname}/extras/

%files extras-gnome
%{_datadir}/gnome-background-properties/%{bgname}-extras.xml

%files extras-kde
%{_kde4_datadir}/wallpapers/%{Bg_Name}_*/

%files extras-mate
%{_datadir}/mate-background-properties/%{bgname}-extras.xml

%files extras-xfce
%{_datadir}/xfce4/backdrops/
%endif

%changelog
* Wed Mar 04 2020 Luya Tshimbalanga <luya@fedoraproject.org> - 32.1.0-1
- Initial release for Fedora 32
- Fix spelling of GNOME

