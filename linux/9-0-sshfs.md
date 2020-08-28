# setup & mount `sshfs` file servers

there's 2 type of server:
- single source of remote-fs, storage-only, assume `SSHFS_SOURCE`
- multiple client of remote-fs, provide data proxy & access, assume `SSHFS_CLIENT`

before should setup `.ssh/config` so `SSHFS_CLIENT` can ssh to `SSHFS_SOURCE`


## `SSHFS_SOURCE` setup

assume data root is `SSHFS_SOURCE:~/data/`

to sync data with `ssh`&`rsync`, setup `~/.ssh/config` and use script like:
```shell script
rsync -av ssh-source:~/data/ ~/data/
```

consider reset file permission in `SSHFS_SOURCE` to root: (easier to match user across server)
```shell script
sudo find file -type d -exec chmod 777 {} + # reset all directory to 777
sudo find file -type f -exec chmod 666 {} + # reset all file to 666
sudo chown -R root:root ~/data # reset owner to root
```


## `SSHFS_CLIENT` setup

test mount with:
```shell script
sudo sshfs -o allow_other,IdentityFile=/path/to/ssh/KEY.pri USER@HOSTNAME_OR_IP:/home/USER/data/ /mnt/SSHFS_SOURCE/
```

basic setup, edited from: https://www.digitalocean.com/community/tutorials/how-to-use-sshfs-to-mount-remote-file-systems-over-ssh
```shell script
sudo pacman -S --needed sshfs # arch
sudo apt install sshfs -y # debian/ubuntu

sudo mkdir -p /mnt/SSHFS_SOURCE
sudo nano /etc/fstab
## ADD IN EDITOR
##  sshfs#USER@HOSTNAME_OR_IP:/home/USER/data/ /mnt/SSHFS_SOURCE/ fuse _netdev,user,auto_cache,reconnect,allow_other,IdentityFile=/path/to/ssh/KEY.pri 0 0
```
reboot to apply change, or try: `sudo mount -a` (https://unix.stackexchange.com/questions/477794/how-to-force-os-reload-of-fstab)

extra links:
- https://stackoverflow.com/questions/19971811/sshfs-as-regular-user-through-fstab
- https://askubuntu.com/questions/710149/how-to-convert-sshfs-command-to-fstab-entry
- https://unix.stackexchange.com/questions/169697/how-does-netdev-mount-option-in-etc-fstab-work


## TODO

currently `du -hd1` from `SSHFS_CLIENT` is slow due to large amount of file inode access
