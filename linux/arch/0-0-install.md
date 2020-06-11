# install Arch Linux

Mainly follow the guide: https://wiki.archlinux.org/index.php/Installation_guide
Better keep another device available to search deeper on each step.

The installation is to an Intel Compute Stick [STK2m364CC](https://ark.intel.com/content/www/us/en/ark/products/91981/intel-compute-stick-stk2m364cc.html)

With a USB stick as install media, and only configured working SSH though Wi-Fi, and not proceed further to install GUI.

The resulting system looks like:
- disk space usage:
  ```
  dr@Dr-Arch:~$ df -h
  Filesystem      Size  Used Avail Use% Mounted on
  dev             1.9G     0  1.9G   0% /dev
  run             1.9G  828K  1.9G   1% /run
  /dev/mmcblk0p2   56G  1.9G   51G   4% /
  tmpfs           1.9G     0  1.9G   0% /dev/shm
  tmpfs           1.9G     0  1.9G   0% /sys/fs/cgroup
  tmpfs           1.9G     0  1.9G   0% /tmp
  /dev/mmcblk0p1  511M  144K  511M   1% /efi
  tmpfs           383M     0  383M   0% /run/user/1000
  ```
- memory and process:
  ```
  dr@Dr-Arch:~$ htop
    1  [||                                                                                1.1%]   Tasks: 17; 1 running
    2  [                                                                                  0.0%]   Load average: 0.53 0.21 0.08 
    3  [                                                                                  0.0%]   Uptime: 00:00:59
    4  [                                                                                  0.0%]
    Mem[||||||                                                                      101M/3.74G]
    Swp[                                                                                 0K/0K]
  
      PID USER      PRI  NI  VIRT   RES   SHR S CPU% MEM%   TIME+  Command
        1 root       20   0 26932 10896  8528 S  0.0  0.3  0:01.36 /sbin/init
      426 dr         20   0 18988  9716  8208 S  0.0  0.2  0:00.05 ├─ /usr/lib/systemd/systemd --user
      427 dr         20   0 30540  2764     4 S  0.0  0.1  0:00.00 │  └─ (sd-pam)
      400 root       20   0  5424  1692  1584 S  0.0  0.0  0:00.02 ├─ /sbin/agetty -o -p -- \u --noclear tty1 linux
      398 root       20   0  8732  5592  4912 S  0.0  0.1  0:00.01 ├─ sshd: /usr/bin/sshd -D [listener] 0 of 10-100 startups
      423 root       20   0 10728  7648  6528 S  0.0  0.2  0:00.03 │  └─ sshd: dr [priv]
      432 dr         20   0 10728  4212  3088 S  0.0  0.1  0:00.03 │     └─ sshd: dr@pts/0
      433 dr         20   0  7492  4324  3548 S  0.0  0.1  0:00.03 │        └─ -bash
      437 dr         20   0  8920  4724  3204 R  0.6  0.1  0:00.35 │           └─ htop
      395 root       20   0 13672  8760  7820 S  0.0  0.2  0:00.01 ├─ /usr/bin/wpa_supplicant -c/etc/wpa_supplicant/wpa_supplicant-wlp2s0.conf -iwlp2s0
      393 root       20   0 17496  8228  7128 S  0.0  0.2  0:00.55 ├─ /usr/lib/systemd/systemd-logind
      392 dbus       20   0  6808  4196  3628 S  0.0  0.1  0:00.05 ├─ /usr/bin/dbus-daemon --system --address=systemd: --nofork --nopidfile --systemd-activation --syslog-only
      333 systemd-t  20   0 91664  7028  6016 S  0.0  0.2  0:00.72 ├─ /usr/lib/systemd/systemd-timesyncd
      332 systemd-r  20   0 27376 16948  9316 S  0.0  0.4  0:00.84 ├─ /usr/lib/systemd/systemd-resolved
      290 systemd-n  20   0 26148  8552  7468 S  0.0  0.2  0:00.69 ├─ /usr/lib/systemd/systemd-networkd
      284 root       20   0 31616  9324  7168 S  0.0  0.2  0:01.05 ├─ /usr/lib/systemd/systemd-udevd
      273 root       20   0 54160 15372 14212 S  0.0  0.4  0:00.62 └─ /usr/lib/systemd/systemd-journald
  ```


#### prepare the USB stick

Get ISO from:
- https://archlinux.org/download/
- https://mirrors.tuna.tsinghua.edu.cn/archlinux/iso/

Then make a USB install media with `rufus`(win10) or `dd`(*nix).


#### the state of the Intel Compute Stick before install

The Intel Compute Stick [STK2m364CC](https://ark.intel.com/content/www/us/en/ark/products/91981/intel-compute-stick-stk2m364cc.html) contains a working Ubuntu 1904 before the install.

Under the BIOS Boot menu:
```
- Secure Boot Configuration - Disabled
- Internal UEFI Shell: Disabled
- Network Boot: Enabled
- USB Boot: Enabled
- UEFI Boot: Enabled
- Legacy Boot: Disabled
```

The system disk: (`fdisk -l`)
```
Disklabel type: gpt
/dev/mmcblk0p1    2048   1050623   1048576  512M EFI System
/dev/mmcblk0p2 1050624 119535615 118484992 56.5G Linux filesystem
```

Already having a working Linux before the re-install helps, giving you a good sample to test and compare to.


#### follow the Arch guide

The guide: https://wiki.archlinux.org/index.php/Installation_guide

Boot the USB into the live shell,
follow the guide and play around in the smart `zsh` for a bit,
because soon you may miss that auto TAB feeling.

When reaching the `Connect to the internet` section,
while following: https://wiki.archlinux.org/index.php/Network_configuration/Wireless,
some extra help:
- for me to setup a working WI-FI, `ip link set interface up` is needed, but `iw dev interface set type ibss` is not
- [guide] recommended lazy `wpa_supplicant + systemd-networkd` combo: https://bbs.archlinux.org/viewtopic.php?pid=1393759#p1393759
- [guide] step by step with `wpa_supplicant + dhclient`: https://linuxcommando.blogspot.com/2013/10/how-to-connect-to-wpawpa2-wifi-network.html

Then for the `Partition the disks` section,
I choose to reuse the existing disk partition and boot to `grub`:
- `/mnt` - `/dev/mmcblk0p2`: install root
- `/mnt/efi` - `/dev/mmcblk0p1`: EFI system partition
- `swap` will be added after install as a swapfile

For the `Select the mirrors` section,
make sure to pull 2~4 of the nearest mirror up from the list,
so later the pacman package download will be faster.

Next in the `Install essential packages` section,
I use `pacstrap /mnt base linux linux-firmware networkmanager sudo htop wget`,
since `networkmanager` includes the lazy `wpa_supplicant + systemd-networkd` WI-FI combo.
Later you can still `pacman -S` all the package ypu need after setting up the Wi-Fi.

Last in the `Boot loader` section,
I just follow https://wiki.archlinux.org/index.php/GRUB#Installation_2 with `/efi/` as the `esp` mount point,
and as for processor microcode install the `intel-ucode` package https://wiki.archlinux.org/index.php/Microcode#Installation

Finally, the clear up and reboot.


#### initial boot up

First boot into the installed Arch,
I got a stuck on a text screen for about 1 minute,
this may be some initial configuration, and not happen again.

After that:
- `pacman -S bash-completion man-db which screen openssh git p7zip ...`
- add a normal user with `sudo`: https://wiki.archlinux.org/index.php/General_recommendations#Users_and_groups
- setup SSH server: https://wiki.archlinux.org/index.php/OpenSSH
- add `.bashrc` and alias
- use `watch grep \"cpu MHz\" /proc/cpuinfo` to check the if cpu frequency is too high

my main tweak so far:
```
# intel driver
mesa # OpenGL driver, xf86-video-intel is not recommended, check: https://wiki.archlinux.org/index.php/i>
intel-media-driver # HD Graphics series starting from Broadwell

# X11
xorg-server xorg-xinit autorandr xterm

# window manager
i3-wm i3status dmenu feh # feh as "background"

# font
ttf-symbola # fix JetBarain's emoji
noto-fonts noto-fonts-cjk noto-fonts-emoji # for browser
```
