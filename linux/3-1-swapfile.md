# `swapfile`


NOTE: should only use SSD for swap, or to delay RAM overflow

```shell script
# check: https://wiki.archlinux.org/index.php/swap#Swap_file
sudo dd status=progress if=/dev/zero of=/swapfile bs=1MiB count=1024 # add 1G swap, using `fallocate` will cause `swapon /swapfile` fail on Arch Linux
sudo chmod 600 /swapfile
sudo mkswap /swapfile
sudo swapon /swapfile
sudo cp /etc/fstab /etc/fstab.bak
echo '/swapfile none swap sw 0 0' | sudo tee -a /etc/fstab
sudo swapon --show
free -h
```

to resize existing swapfile:
```shell script
sudo swapoff /swapfile
# redo above steps, without the fstab change
```
