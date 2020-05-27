# `font`

list font: `fc-list | sort | less`

reload font cache: `fc-cache -vf`

#### related consideration

unluckily currently font `Inconsolata@3.000` + `Xft` (for `xterm`, `dmenu`)
result in very wide spacing: https://github.com/googlefonts/Inconsolata/issues/42

to DIY TTF font in arch: just put the file under `/usr/share/fonts/TTF/` and reload cache
