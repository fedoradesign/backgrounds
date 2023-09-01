# f39-backgrounds
A set of default and supplemental wallpapers for Fedora 39

## Testing

One way to test these is to install them on your system
* obtain the src rpm, for example using
```bash
    wget https://github.com/fedoradesign/backgrounds/releases/download/v39.0.1/f39-backgrounds-39.0.1-1.fc39.src.rpm
```
* install tools to build an rpm file, [follow the guide](https://fedoramagazine.org/how-rpm-packages-are-made-the-source-rpm/):
```bash
    sudo dnf install fedora-packager
```
* then build the rpm
```bash
    sudo dnf builddep f39-backgrounds-39.0.1-1.fc39.src.rpm
    rpmbuild --rebuild f39-backgrounds-39.0.1-1.fc39.src.rpm
```
* to install the rpm go to the directory where it has been built, assuming the commands above have been used, the following should work
```bash
    cd rpmbuild/RPMS/noarch
```
* then install the base
```bash
    dnf install f39-backgrounds-base-39.0.1-1.fc39.noarch.rpm
```
* finally install backgrounds for your desktop, for example for KDE 
```bash
    dnf install f39-backgrounds-kde-39.0.1-1.fc39.noarch.rpm
```

The directory should also contain the following rpms

   * f39-backgrounds-39.0.1-1.fc39.noarch.rpm
   * f39-backgrounds-extras-gnome-39.0.1-1.fc39.noarch.rpm
   * f39-backgrounds-gnome-39.0.1-1.fc39.noarch.rpm
   * f39-backgrounds-extras-kde-39.0.1-1.fc39.noarch.rpm
   * f39-backgrounds-kde-39.0.1-1.fc39.noarch.rpm
   * f39-backgrounds-base-39.0.1-1.fc39.noarch.rpm
   * f39-backgrounds-extras-mate-39.0.1-1.fc39.noarch.rpm
   * f39-backgrounds-mate-39.0.1-1.fc39.noarch.rpm
   * f39-backgrounds-extras-base-39.0.1-1.fc39.noarch.rpm
   * f39-backgrounds-extras-xfce-39.0.1-1.fc39.noarch.rpm
   * f39-backgrounds-xfce-39.0.1-1.fc39.noarch.rpm

* You can then change the wallpaper, for example on KDE, right click on the desktop and a menu should appear. Click on the menu and choose *Configure Desktop* then select the icon *Wallpaper* and choose one of the newly installed wallpapers.
