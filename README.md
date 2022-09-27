# f36-backgrounds
A set of default and supplemental wallpapers for Fedora 36

## Testing

One way to test these is to install them on your system
* obtain the src rpm, for example using
```bash
    wget https://github.com/fedoradesign/backgrounds/releases/download/v37.0.1/f37-backgrounds-37.0.2-1.f37.src.rpm
```
* install tools to build an rpm file following [this guide](https://fedoramagazine.org/how-rpm-packages-are-made-the-source-rpm/):
```bash
    sudo dnf install fedora-packager
```    
* then build the rpm
```bash
    sudo dnf builddep f37-backgrounds-37.0.2-1.f37.src.rpm
    rpmbuild --rebuild f37-backgrounds-37.0.2-1.f37.src.rpm
```
* to install the rpm go to the directory where it has been built, assuming the commands above have been used, the following should work
```bash
    cd rpmbuild/RPMS/noarch
```
* then install the base
```bash    
    dnf install f37-backgrounds-base-37.0.2-1.f37.noarch.rpm
```
* finally install backgrounds for your desktop, for example for KDE 
```bash
    dnf install f37-backgrounds-kde-37.0.2-1.f37.noarch.rpm
```

The directory should also contain the following rpms

   * f37-backgrounds-37.0.2-1.f37.noarch.rpm              
   * f37-backgrounds-extras-gnome-37.0.2-1.f37.noarch.rpm  
   * f37-backgrounds-gnome-37.0.2-1.f37.noarch.rpm
   * f37-backgrounds-extras-kde-37.0.2-1.f37.noarch.rpm    
   * f37-backgrounds-kde-37.0.2-1.f37.noarch.rpm
   * f37-backgrounds-base-37.0.2-1.f37.noarch.rpm         
   * f37-backgrounds-extras-mate-37.0.2-1.f37.noarch.rpm   
   * f37-backgrounds-mate-37.0.2-1.f37.noarch.rpm
   * f37-backgrounds-extras-base-37.0.2-1.f37.noarch.rpm  
   * f37-backgrounds-extras-xfce-37.0.2-1.f37.noarch.rpm   
   * f37-backgrounds-xfce-37.0.2-1.f37.noarch.rpm

* You can then change the wallpaper, for example on KDE, right click on the desktop and a menu should appear. Click on the menu and choose *Configure Desktop* then select the icon *Wallpaper* and choose one of the newly installed wallpers.
   
