# f34-backgrounds
A set of default and supplemental wallpapers for Fedora 34

## Testing

One way to test these is to install them on your system
* obtain the src rpm, for example using
```bash
    wget https://github.com/fedoradesign/backgrounds/releases/download/v34.0.1/f34-backgrounds-34.0.1-1.f35.src.rpm
```
* install tools to build an rpm file, follow the guide [here](https://fedoramagazine.org/how-rpm-packages-are-made-the-source-rpm/):
```bash
    sudo dnf install fedora-packager
```    
* then build the rpm
```bash
    sudo dnf builddep f34-backgrounds-34.0.1-1.f35.src.rpm
    rpmbuild --rebuild f34-backgrounds-34.0.1-1.f35.src.rpm
```
* to install the rpm go to the directory where it has been built, assuming the commands above have been used, the following should work
```bash
    cd rpmbuild/RPMS/noarch
```
* then install the base
```bash    
    dnf install f34-backgrounds-base-34.0.1-1.f35.noarch.rpm
```
* finally install backgrounds for your desktop, for example for KDE 
```bash
    dnf install f34-backgrounds-kde-34.0.1-1.f35.noarch.rpm
```

The directory should also contain the following rpms

   * f34-backgrounds-34.0.1-1.f35.noarch.rpm              
   * f34-backgrounds-extras-gnome-34.0.1-1.f35.noarch.rpm  
   * f34-backgrounds-gnome-34.0.1-1.f35.noarch.rpm
   * f34-backgrounds-extras-kde-34.0.1-1.f35.noarch.rpm    
   * f34-backgrounds-kde-34.0.1-1.f35.noarch.rpm
   * f34-backgrounds-base-34.0.1-1.f35.noarch.rpm         
   * f34-backgrounds-extras-mate-34.0.1-1.f35.noarch.rpm   
   * f34-backgrounds-mate-34.0.1-1.f35.noarch.rpm
   * f34-backgrounds-extras-base-34.0.1-1.f35.noarch.rpm  
   * f34-backgrounds-extras-xfce-34.0.1-1.f35.noarch.rpm   
   * f34-backgrounds-xfce-34.0.1-1.f35.noarch.rpm

* You can then change the wallpaper, for example on KDE, right click on the desktop and a menu should appear. Click on the menu and choose *Configure Desktop* then select the icon *Wallpaper* and choose one of the newly installed wallpers.
   
