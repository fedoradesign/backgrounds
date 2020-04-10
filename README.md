# f32-backgrounds
A set of default and supplemental wallpapers for Fedora 32

## Testing

One way to test these is to install them on your system
* obtain the src rpm, for example using
```bash
    wget https://github.com/fedoradesign/backgrounds/releases/download/v32.0.0/f32-backgrounds-32.1.0-1.fc32.src.rpm
```
* install tools to build an rpm file, follow the guide [here](https://fedoramagazine.org/how-rpm-packages-are-made-the-source-rpm/):
```bash
    sudo dnf install fedora-packager
```    
* then build the rpm
```bash
    sudo dnf builddep f32-backgrounds-32.1.0-1.fc32.src.rpm
    rpmbuild --rebuild f32-backgrounds-32.1.0-1.fc32.src.rpm
```
* to install the rpm go to the directory where it has been built, assuming the commands above have been used, the following should work
```bash
    cd rpmbuild/RPMS/noarch
```
* then install the base
```bash    
    dnf install f32-backgrounds-base-32.1.0-1.fc32.noarch.rpm
```
* finally install backgrounds for your desktop, for example for KDE 
```bash
    dnf install f32-backgrounds-kde-32.1.0-1.fc32.noarch.rpm
```

The directory should also contain the following rpms

   * f32-backgrounds-32.1.0-1.fc32.noarch.rpm
   * f32-backgrounds-extras-gnome-32.1.0-1.fc32.noarch.rpm
   * f32-backgrounds-gnome-32.1.0-1.fc32.noarch.rpm
   * f32-backgrounds-animated-32.1.0-1.fc32.noarch.rpm
   * f32-backgrounds-kde-32.1.0-1.fc32.noarch.rpm
   * f32-backgrounds-base-32.1.0-1.fc32.noarch.rpm
   * f32-backgrounds-mate-32.1.0-1.fc32.noarch.rpm
   * f32-backgrounds-xfce-32.1.0-1.fc32.noarch.rpm

* You can then change the wallpaper, for example on KDE, right click on the desktop and a menu should appear. Click on the menu and choose *Configure Desktop* then select the icon *Wallpaper* and choose one of the newly installed wallpers.
   
