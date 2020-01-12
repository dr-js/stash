# `swapfile`


NOTE: should only use SSD for swap
```shell script
sudo fallocate -l 0.5G /swapfile # add 0.5G swap, or change to 2G
sudo chmod 600 /swapfile
sudo mkswap /swapfile
sudo swapon /swapfile
sudo cp /etc/fstab /etc/fstab.bak
echo '/swapfile none swap sw 0 0' | sudo tee -a /etc/fstab
sudo swapon --show
free -h
```
