# common init setup

```shell
sudo mkdir -p /opt/dr/
sudo chmod 777 /opt/dr/
mkdir -p /opt/dr/init/

tee /opt/dr/init/INIT.sh <<- 'EOM'
#!/usr/bin/env bash
## init for local-pi
# will run as root

# [tunnel-54321]
screen -ls tunnel-54321 || screen -S tunnel-54321 -dm DR --stp 127.0.0.1:54320 -H :54321

# [dr-stc-80]
screen -ls dr-stc-80 || screen -S dr-stc-80 -dm DR --stc -H :80

# [dr-swg-12345]
screen -ls dr-swg-12345 || screen -S dr-swg-12345 -dm DR --swg -H :12345
EOM
chmod +x /opt/dr/init/INIT.sh

tee /opt/dr/init/dr-init.service <<- 'EOM'
[Unit]
Description="Pull up most servers, every 15sec"
After=network.target
StartLimitIntervalSec=0

[Service]
Type=simple
Restart=always
RestartSec=15
# keep screen running
KillMode=none
User=root
ExecStart="/opt/dr/init/INIT.sh"

[Install]
WantedBy=multi-user.target
EOM

# enable
sudo ln -sfT /opt/dr/init/dr-init.service /lib/systemd/system/dr-init.service
sudo systemctl start dr-init.service
sudo systemctl enable dr-init.service
sudo systemctl status dr-init.service

# remove
sudo systemctl stop dr-init.service
sudo systemctl disable dr-init.service
sudo rm /lib/systemd/system/dr-init.service
```
