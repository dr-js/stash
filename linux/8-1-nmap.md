# `nmap`

`nmap` (Network Mapper) is an open source tool for network exploration and security auditing.
It was designed to rapidly scan large networks, although it works fine against single hosts.

useful for finding your headless linux box's LAN ip address

sample command: `nmap -sP -n 192.168.0.0/24`

one quick way for getting your LAN address range is: `node -p "os.networkInterfaces()"`

reference:
- https://wiki.archlinux.org/index.php/nmap
- https://bbs.archlinux.org/viewtopic.php?id=106637
- https://stackoverflow.com/questions/20103185/faster-host-discovery-with-nmap
