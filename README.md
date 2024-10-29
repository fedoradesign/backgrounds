# f41-backgrounds
A set of default and supplemental wallpapers for Fedora 41

## Testing

One way to test these is to install them on your system
* obtain the src rpm, for example using
```bash
    wget https://github.com/fedoradesign/backgrounds/releases/download/v41.0.1/f40-backgrounds-41.0.1-1.fc41.src.rpm
```
* install tools to build an rpm file, [follow the guide](https://fedoramagazine.org/how-rpm-packages-are-made-the-source-rpm/):
```bash
    sudo dnf install fedora-packager
```
* then build the rpm
```bash
    sudo dnf builddep f4-backgrounds-41.0.1-1.fc41.src.rpm
    rpmbuild --rebuild f41-backgrounds-41.0.1-1.fc41.src.rpm
```
* to install the rpm go to the directory where it has been built, assuming the commands above have been used, the following should work
```bash
    cd rpmbuild/RPMS/noarch
```
* then install the base
```bash
    dnf install f41-backgrounds-base-41.0.1-1.fc41.src.rpm
```
* finally install backgrounds for your desktop, for example for KDE 
```bash
    dnf install f41-backgrounds-kde-41.0.1-1.fc41.src.rpm
```

The directory should also contain the following rpms

   * f41-backgrounds-41.0.1-1.fc41.src.rpm
   * f41-backgrounds-base-41.0.1-1.fc41.src.rpm
   * f41-backgrounds-budgie-41.0.1-1.fc41.src.rpm
   * f41-backgrounds-gnome-41.0.1-1.fc41.src.rpm
   * f41-backgrounds-kde-41.0.1-1.fc41.src.rpm
   * f41-backgrounds-mate-41.0.1-1.fc41.src.rpm
   * f41-backgrounds-xfce-41.0.1-1.fc41.src.rpm

* You can then change the wallpaper, for example on KDE, right click on the desktop and a menu should appear. Click on the menu and choose *Configure Desktop* then select the icon *Wallpaper* and choose one of the newly installed wallpapers.
