# `cron`


#### `cron` with `~/D/init.sh`

create `~/D/init.sh`:
```shell script
mkdir -p ~/D/
touch ~/D/init.sh
chmod +x ~/D/*.sh
```

edit `nano ~/D/init.sh` add:

```shell script
#!/usr/bin/env bash

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
