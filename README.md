# f36-backgrounds
A set of default and supplemental wallpapers for Fedora 36

## Testing

One way to test these is to install them on your system
* obtain the src rpm, for example using
```bash
    wget https://github.com/fedoradesign/backgrounds/releases/download/v36.0.1/f36-backgrounds-36.0.1-1.f35.src.rpm
```
* install tools to build an rpm file, follow the guide [here](https://fedoramagazine.org/how-rpm-packages-are-made-the-source-rpm/):
```bash
    sudo dnf install fedora-packager
```    
* then build the rpm
```bash
    sudo dnf builddep f36-backgrounds-36.0.1-1.f35.src.rpm
    rpmbuild --rebuild f36-backgrounds-36.0.1-1.f35.src.rpm
```
* to install the rpm go to the directory where it has been built, assuming the commands above have been used, the following should work
```bash
    cd rpmbuild/RPMS/noarch
```
* then install the base
```bash    
    dnf install f36-backgrounds-base-36.0.1-1.f35.noarch.rpm
```
* finally install backgrounds for your desktop, for example for KDE 
```bash
    dnf install f36-backgrounds-kde-36.0.1-1.f35.noarch.rpm
```

The directory should also contain the following rpms

   * f36-backgrounds-36.0.1-1.f35.noarch.rpm              
   * f36-backgrounds-extras-gnome-36.0.1-1.f35.noarch.rpm  
   * f36-backgrounds-gnome-36.0.1-1.f35.noarch.rpm
   * f36-backgrounds-extras-kde-36.0.1-1.f35.noarch.rpm    
   * f36-backgrounds-kde-36.0.1-1.f35.noarch.rpm
   * f36-backgrounds-base-36.0.1-1.f35.noarch.rpm         
   * f36-backgrounds-extras-mate-36.0.1-1.f35.noarch.rpm   
   * f36-backgrounds-mate-36.0.1-1.f35.noarch.rpm
   * f36-backgrounds-extras-base-36.0.1-1.f35.noarch.rpm  
   * f36-backgrounds-extras-xfce-36.0.1-1.f35.noarch.rpm   
   * f36-backgrounds-xfce-36.0.1-1.f35.noarch.rpm

* You can then change the wallpaper, for example on KDE, right click on the desktop and a menu should appear. Click on the menu and choose *Configure Desktop* then select the icon *Wallpaper* and choose one of the newly installed wallpers.
   
