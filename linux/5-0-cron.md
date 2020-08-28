# `cron`


#### `cron` with `/root/D/init.sh`

create `/root/D/init.sh`:
```shell script
sudo mkdir -p /root/D/
sudo touch /root/D/init.sh
sudo chmod +x /root/D/*.sh
```

edit `sudo nano /root/D/init.sh` add:

```shell script
#!/usr/bin/env bash
set -e 
set -o pipefail

SCRIPT_PATH=$(dirname "${PWD}/${BASH_SOURCE[0]}") # Absolute path this script is in
cd ${SCRIPT_PATH} # path reset

# NOTE: this file should be run by cron (check `sudo crontab -e`)

# run each script
# source ./script-file-0.sh
# source ./script-file-1.sh
# source ./script-file-2.sh
```

setup `crontab`: `sudo crontab -e` add:
```shell script
@reboot  /root/D/init.sh
```
