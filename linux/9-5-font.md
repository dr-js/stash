# `font`

list font: `fc-list | sort | less`

reload font cache: `fc-cache -vf`


#### add custom default

with `nano /opt/dr/common/font/local.conf` and add config like:
```xml
<?xml version="1.0"?>
<!DOCTYPE fontconfig SYSTEM "fonts.dtd">
<fontconfig>
 <alias>
   <family>sans-serif</family>
   <prefer>
     <family>Noto Sans</family>
     <family>Noto Color Emoji</family>
     <family>Noto Emoji</family>
   </prefer> 
 </alias>

 <alias>
   <family>serif</family>
   <prefer>
     <family>Noto Serif</family>
     <family>Noto Color Emoji</family>
     <family>Noto Emoji</family>
   </prefer>
 </alias>

 <alias>
  <family>monospace</family>
  <prefer>
    <family>Consolas</family>
    <family>Noto Color Emoji</family>
    <family>Noto Emoji</family>
   </prefer>
 </alias>
</fontconfig>
```

and symlink to system font config `sudo ln -sfT /opt/dr/common/font/local.conf /etc/fonts/local.conf`

NOTE: for `Consolas` the file need to be copied from a win32 machine at `C:\Windows\Fonts\Consolas`,
  and put under path like `/usr/share/fonts/TTF/` then reload font cache.


#### related consideration

unluckily currently font `Inconsolata@3.000` + `Xft` (for `xterm`, `dmenu`)
result in very wide spacing: https://github.com/googlefonts/Inconsolata/issues/42

to DIY TTF font in arch: just put the file under `/usr/share/fonts/TTF/` and reload cache
