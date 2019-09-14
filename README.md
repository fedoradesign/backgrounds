# f31-backgrounds
A set of default and supplemental wallpapers for Fedora 31

## Testing

One way to test these is to install them on your system
* obtain the src rpm, for example using
```bash
    wget https://github.com/fedoradesign/backgrounds/releases/download/v31.0.3/f31-backgrounds-31.0.3-1.fc32.src.rpm
```
* install tools to build an rpm file, follow the guide [here](https://fedoramagazine.org/how-rpm-packages-are-made-the-source-rpm/):
```bash
    sudo dnf install fedora-packager
```    
* then build the rpm
```bash
    sudo dnf builddep f31-backgrounds-31.0.3-1.fc32.src.rpm
    rpmbuild --rebuild f31-backgrounds-31.0.3-1.fc32.src.rpm
```
* to install the rpm go to the directory where it has been built, assuming the commands above have been used, the following should work
```bash
    cd rpmbuild/RPMS/noarch
```
* then install the base
```bash    
    dnf install f31-backgrounds-base-31.0.3-1.fc30.noarch.rpm
```
* finally install backgrounds for your desktop, for example for KDE 
```bash
    dnf install f31-backgrounds-kde-31.0.3-1.fc30.noarch.rpm
```

The directory should also contain the following rpms

   * f31-backgrounds-31.0.3-1.fc30.noarch.rpm              
   * f31-backgrounds-extras-gnome-31.0.3-1.fc30.noarch.rpm  
   * f31-backgrounds-gnome-31.0.3-1.fc30.noarch.rpm
   * f31-backgrounds-animated-31.0.3-1.fc30.noarch.rpm     
   * f31-backgrounds-extras-kde-31.0.3-1.fc30.noarch.rpm    
   * f31-backgrounds-kde-31.0.3-1.fc30.noarch.rpm
   * f31-backgrounds-base-31.0.3-1.fc30.noarch.rpm         
   * f31-backgrounds-extras-mate-31.0.3-1.fc30.noarch.rpm   
   * f31-backgrounds-mate-31.0.3-1.fc30.noarch.rpm
   * f31-backgrounds-extras-base-31.0.3-1.fc30.noarch.rpm  
   * f31-backgrounds-extras-xfce-31.0.3-1.fc30.noarch.rpm   
   * f31-backgrounds-xfce-31.0.3-1.fc30.noarch.rpm

* You can then change the wallpaper, for example on KDE, right click on the desktop and a menu should appear. Click on the menu and choose *Configure Desktop* then select the icon *Wallpaper* and choose one of the newly installed wallpers.
   
