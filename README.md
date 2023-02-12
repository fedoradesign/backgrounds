# f38-backgrounds
A set of default and supplemental wallpapers for Fedora 38

## Testing

One way to test these is to install them on your system
* obtain the src rpm, for example using
```bash
    wget https://github.com/fedoradesign/backgrounds/releases/download/v38.0.0/f38-backgrounds-38.0.0-1.f38.src.rpm
```
* install tools to build an rpm file, [follow the guide](https://fedoramagazine.org/how-rpm-packages-are-made-the-source-rpm/):
```bash
    sudo dnf install fedora-packager
```    
* then build the rpm
```bash
    sudo dnf builddep f38-backgrounds-38.0.0-1.f38.src.rpm
    rpmbuild --rebuild f38-backgrounds-38.0.0-1.f38.src.rpm
```
* to install the rpm go to the directory where it has been built, assuming the commands above have been used, the following should work
```bash
    cd rpmbuild/RPMS/noarch
```
* then install the base
```bash    
    dnf install f38-backgrounds-base-38.0.0-1.f38.noarch.rpm
```
* finally install backgrounds for your desktop, for example for KDE 
```bash
    dnf install f38-backgrounds-kde-38.0.0-1.f38.noarch.rpm
```

The directory should also contain the following rpms

   * f38-backgrounds-38.0.0-1.f38.noarch.rpm              
   * f38-backgrounds-extras-gnome-38.0.0-1.f38.noarch.rpm  
   * f38-backgrounds-gnome-38.0.0-1.f38.noarch.rpm
   * f38-backgrounds-extras-kde-38.0.0-1.f38.noarch.rpm    
   * f38-backgrounds-kde-38.0.0-1.f38.noarch.rpm
   * f38-backgrounds-base-38.0.0-1.f38.noarch.rpm         
   * f38-backgrounds-extras-mate-38.0.0-1.f38.noarch.rpm   
   * f38-backgrounds-mate-38.0.0-1.f38.noarch.rpm
   * f38-backgrounds-extras-base-38.0.0-1.f38.noarch.rpm  
   * f38-backgrounds-extras-xfce-38.0.0-1.f38.noarch.rpm   
   * f38-backgrounds-xfce-38.0.0-1.f38.noarch.rpm

* You can then change the wallpaper, for example on KDE, right click on the desktop and a menu should appear. Click on the menu and choose *Configure Desktop* then select the icon *Wallpaper* and choose one of the newly installed wallpapers.
   
