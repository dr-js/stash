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
