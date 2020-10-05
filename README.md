# f33-backgrounds
A set of default and supplemental wallpapers for Fedora 33

## Testing

One way to test these is to install them on your system
* obtain the src rpm, for example using
```bash
    wget https://github.com/fedoradesign/backgrounds/releases/download/v33.0.3/f33-backgrounds-33.0.6-1.fc33.src.rpm
```
* install tools to build an rpm file, follow the guide [here](https://fedoramagazine.org/how-rpm-packages-are-made-the-source-rpm/):
```bash
    sudo dnf install fedora-packager
```    
* then build the rpm
```bash
    sudo dnf builddep f33-backgrounds-33.0.6-1.fc33.src.rpm
    rpmbuild --rebuild f33-backgrounds-33.0.6-1.fc33.src.rpm
```
* to install the rpm go to the directory where it has been built, assuming the commands above have been used, the following should work
```bash
    cd rpmbuild/RPMS/noarch
```
* then install the base
```bash    
    dnf install f33-backgrounds-base-33.0.6-1.fc33.noarch.rpm
```
* finally install backgrounds for your desktop, for example for KDE 
```bash
    dnf install f33-backgrounds-kde-33.0.6-1.fc33.noarch.rpm
```

The directory should also contain the following rpms

   * f33-backgrounds-33.0.6-1.fc33.noarch.rpm              
   * f33-backgrounds-extras-gnome-33.0.6-1.fc33.noarch.rpm  
   * f33-backgrounds-gnome-33.0.6-1.fc33.noarch.rpm
   * f33-backgrounds-extras-kde-33.0.6-1.fc33.noarch.rpm    
   * f33-backgrounds-kde-33.0.6-1.fc33.noarch.rpm
   * f33-backgrounds-base-33.0.6-1.fc33.noarch.rpm         
   * f33-backgrounds-extras-mate-33.0.6-1.fc33.noarch.rpm   
   * f33-backgrounds-mate-33.0.6-1.fc33.noarch.rpm
   * f33-backgrounds-extras-base-33.0.6-1.fc33.noarch.rpm  
   * f33-backgrounds-extras-xfce-33.0.6-1.fc33.noarch.rpm   
   * f33-backgrounds-xfce-33.0.6-1.fc33.noarch.rpm

* You can then change the wallpaper, for example on KDE, right click on the desktop and a menu should appear. Click on the menu and choose *Configure Desktop* then select the icon *Wallpaper* and choose one of the newly installed wallpers.
   
