# package manager


#### apt ubuntu clean up

default useless package from ubuntu:
```shell script
sudo apt autoremove --purge \
  snapd $(: "will also remove amazon-ssm-agent; most for GUI package, not used in server: https://askubuntu.com/questions/1035915/how-to-remove-snap-store-from-ubuntu") \
  accountsservice $(: "https://www.linux.com/learn/cleaning-your-linux-startup-process") \
  popularity-contest $(: "disabled by default, but no use anyway: https://askubuntu.com/questions/57808/what-is-the-popularity-contest-package-for") \
  mlocate locate $(: "quick lookup of file names based on an index that's (typically) rebuilt every night: https://unix.stackexchange.com/questions/273182/difference-between-locate-and-mlocate") \
  -y $(: "skip confirm")
```

optionally, not used package: (check: https://peteris.rocks/blog/htop/)
```shell script
sudo apt autoremove --purge \
  lxcfs $(: "not used; FUSE filesystem for LXC: https://github.com/lxc/lxcfs") \
  lvm2 $(: "not used; Logical Volume Manager: https://blog.vpscheap.net/when-to-use-lvm/; https://askubuntu.com/questions/202613/how-do-i-check-whether-i-am-using-lvm") \
  open-iscsi $(: "not used; Internet Small Computer System Interface (iSCSI) Protocol: http://www.open-iscsi.com/") \
  ubuntu-server $(: "install each manually; bundle of package: https://packages.ubuntu.com/bionic/ubuntu-server") \
  irqbalance $(: "not used, for multi-core CPU thread balance; distribute hardware interrupts across processors on a multiprocessor system in order to increase performance: https://github.com/irqbalance/irqbalance") \
  fail2ban $(: "not used, use ufw or VPS config; update firewall rules to reject the IP addresses for a specified amount of time:https://www.fail2ban.org/") \
  $(: "manual confirm")
```


#### common tool

change pacman mirror `sudo nano /etc/pacman.d/mirrorlist`:
- check: https://wiki.archlinux.org/index.php/Pacman#Repositories_and_mirrors
- check: https://mirrors.tuna.tsinghua.edu.cn/help/archlinux/ (for ALARM: `Server = http://mirrors.tuna.tsinghua.edu.cn/archlinuxarm/$arch/$repo`)

change apt mirror `sudo nano /etc/apt/sources.list` to a closer server:
- check: https://wiki.ubuntu.com/Mirrors
- check mirror list: https://launchpad.net/ubuntu/+archivemirrors
- check: https://mirrors.tuna.tsinghua.edu.cn/help/raspbian/
- setup apt proxy, check: `./8-9-proxy-config.md`

```shell script
# arch
sudo pacman -S --needed \
  nano less screen curl wget openssh $(: "essential tool, sanity check") \
  tar gzip p7zip $(: "compress tool") \
  htop $(: "process stat") \
  vnstat nethogs $(: "net stat") \
  git $(: "develop tool") \
  man bash-completion $(: "arch CLI basic") \
  --noconfirm $(: "skip confirm")

# debian/ubuntu
sudo apt update
sudo apt install \
  nano less screen curl wget openssh-client openssh-server $(: "essential tool, sanity check") \
  tar gzip p7zip-full $(: "compress tool") \
  htop $(: "process stat") \
  vnstat nethogs $(: "net stat") \
  git $(: "develop tool") \
  -y $(: "skip confirm")
```
