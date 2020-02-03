# `systemd`


```shell script
# list enabled service:
systemctl list-units --type=service --state=active
systemctl list-unit-files --type=service --state=enabled,generated

# check service/unit log:
journalctl -u SERVICE-NAME.service
```

content for `sample-server.service`: (should put under: `/lib/systemd/system/`)
```ini
[Unit]
Description="SAMPLE SERVICE FILE"
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
