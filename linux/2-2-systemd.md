# `systemd`


```shell script
# list enabled service:
systemctl list-units --type=service --state=active
systemctl list-unit-files --type=service --state=enabled,generated

# check service/unit log:
journalctl -u SERVICE-NAME.service

# check network config: (mainly DNS, test and set to faster DNS for better web surf experience)
cat /etc/systemd/resolved.conf
cat /etc/systemd/resolved.conf.d/*
cat /etc/netplan/*
cat /etc/network/interfaces
cat /etc/resolv.conf
sudo systemd-resolve --status
```

content for `sample-server.service`: (should put under: `/lib/systemd/system/`)
```ini
[Unit]
Description="SAMPLE SERVER SERVICE FILE"
After=network.target
StartLimitIntervalSec=0

[Service]
Type=simple
Restart=always
RestartSec=5
User=root
ExecStart="/absolute/path/to/script/file.sh"
ExecStop="/optional/absolute/path/to/script/file.sh"

[Install]
WantedBy=multi-user.target
```

#### Manjaro

manjaro will auto update it's pacman mirror-list per-week by default,
  if local cache mirror is set in `/etc/pacman.d/mirrorlist`,
  stop the timer or the change will be lost: (check https://wiki.manjaro.org/index.php?title=Pacman-mirrors#Country)
```shell
sudo systemctrl stop pamac-mirrorlist.timer
sudo systemctrl disable pamac-mirrorlist.timer
```

#### WSL2

for WSL2 Debian there's no `systemd`, so instead run daemon with something like this:
```shell script
# init for WSL2 Debian

sudo bash <<"EOF"

# all should run as root
shopt -s expand_aliases # allow alias
source ~/.bash_aliases_extend # load alias

# sshd
mkdir -p "/run/sshd"
screen -ls sshd || screen -S sshd -dm "$(which sshd)" -D

# ss-local(shadowsocks-libev) + privoxy
screen -ls ss-local || screen -S ss-local -dm "$(which ss-local)" -c /etc/shadowsocks-libev/local-config.json
screen -ls privoxy || screen -S privoxy -dm "$(which privoxy)" --no-daemon /etc/privoxy/config

# dockerd(+proxy) & containerd
screen -ls containerd || screen -S containerd -dm "$(which containerd)"
screen -ls dockerd || PX1 screen -S dockerd -dm "$(which dockerd)"

EOF
```
