# f42-backgrounds
A set of default and supplemental wallpapers for Fedora 42

## Testing

One way to test these is to install them on your system
* obtain the src rpm, for example using
```bash
    wget https://github.com/fedoradesign/backgrounds/releases/download/v42.0.0/f40-backgrounds-42.0.0-3.fc42.src.rpm
```
* install tools to build an rpm file, [follow the guide](https://fedoramagazine.org/how-rpm-packages-are-made-the-source-rpm/):
```bash
    sudo dnf install fedora-packager
```
* then build the rpm
```bash
    sudo dnf builddep f4-backgrounds-42.0.0-3.fc42.src.rpm
    rpmbuild --rebuild f42-backgrounds-42.0.0-3.fc42.src.rpm
```
* to install the rpm go to the directory where it has been built, assuming the commands above have been used, the following should work
```bash
    cd rpmbuild/RPMS/noarch
```
* then install the base
```bash
    dnf install f42-backgrounds-base-42.0.0-3.fc42.src.rpm
```
* finally install backgrounds for your desktop, for example for KDE 
```bash
    dnf install f42-backgrounds-kde-42.0.0-3.fc42.src.rpm
```

The directory should also contain the following rpms

   * f42-backgrounds-42.0.0-3.fc42.src.rpm
   * f42-backgrounds-base-42.0.0-3.fc42.src.rpm
   * f42-backgrounds-budgie-42.0.0-3.fc42.src.rpm
   * f42-backgrounds-gnome-42.0.0-3.fc42.src.rpm
   * f42-backgrounds-kde-42.0.0-3.fc42.src.rpm
   * f42-backgrounds-mate-42.0.0-3.fc42.src.rpm
   * f42-backgrounds-xfce-42.0.0-3.fc42.src.rpm

* You can then change the wallpaper, for example on KDE, right click on the desktop and a menu should appear. Click on the menu and choose *Configure Desktop* then select the icon *Wallpaper* and choose one of the newly installed wallpapers.
