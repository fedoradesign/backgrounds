# f43-backgrounds
A set of default wallpapers for Fedora 43

## Testing

One way to test these is to install them on your system
* obtain the src rpm, for example using
```bash
    wget https://github.com/fedoradesign/backgrounds/releases/download/v43.0.1/f40-backgrounds-43.0.2-1.fc42.src.rpm
```
* install tools to build an rpm file, [follow the guide](https://fedoramagazine.org/how-rpm-packages-are-made-the-source-rpm/):
```bash
    sudo dnf install fedora-packager
```
* then build the rpm
```bash
    sudo dnf builddep f43-backgrounds-43.0.2-1.fc42.src.rpm
    rpmbuild --rebuild f43-backgrounds-43.0.2-1.fc42.src.rpm
```
* to install the rpm go to the directory where it has been built, assuming the commands above have been used, the following should work
```bash
    cd rpmbuild/RPMS/noarch
```
* then install the base
```bash
    dnf install f43-backgrounds-base-43.0.2-1.fc42.noarch.rpm
```
* finally install backgrounds for your desktop, for example for KDE 
```bash
    dnf install f43-backgrounds-kde-43.0.2-1.fc42.noarch.rpm
```

The directory should also contain the following rpms

   * f43-backgrounds-43.0.2-1.fc42.noarch.rpm
   * f43-backgrounds-base-43.0.2-1.fc42.noarch.rpm
   * f43-backgrounds-budgie-43.0.2-1.fc42.noarch.rpm
   * f43-backgrounds-gnome-43.0.2-1.fc42.noarch.rpm
   * f43-backgrounds-kde-43.0.2-1.fc42.noarch.rpm
   * f43-backgrounds-mate-43.0.2-1.fc42.noarch.rpm
   * f43-backgrounds-xfce-43.0.2-1.fc42.noarch.rpm

* You can then change the wallpaper, for example on KDE, right click on the desktop and a menu should appear. Click on the menu and choose *Configure Desktop* then select the icon *Wallpaper* and choose one of the newly installed wallpapers.
