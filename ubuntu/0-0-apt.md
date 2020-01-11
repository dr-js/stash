# `apt`

#### apt clean up

> - snapd (also remove amazon-ssm-agent)
>   - https://askubuntu.com/questions/1035915/how-to-remove-snap-store-from-ubuntu
> - account-daemon
>   - https://www.linux.com/learn/cleaning-your-linux-startup-process
> - cron related
>   - popularity-contest
>   - mlocate / mlocate

```shell script
sudo apt autoremove --purge -y \
  snapd \
  accountsservice \
  popularity-contest \
  mlocate locate
```

optionally: (check: https://peteris.rocks/blog/htop/)
- should check: https://github.com/lxc/lxcfs
- should check: https://askubuntu.com/questions/202613/how-do-i-check-whether-i-am-using-lvm
```shell script
sudo apt autoremove --purge \
  lxcfs \
  lvm2 \
  ubuntu-server
```


#### apt common tool

change apt mirror `sudo nano /etc/apt/sources.list` to a closer server:
- check: https://wiki.ubuntu.com/Mirrors
- check list: https://launchpad.net/ubuntu/+archivemirrors
- setup apt proxy: `sudo nano /etc/apt/apt.conf.d/70debconf`, add:
  ```
  Acquire::http::Proxy "http://127.0.0.1:1080/";
  ```

```shell script
sudo apt update
sudo apt install -y \
  nano less screen \
  tar gzip p7zip-full \
  htop vnstat nethogs \
  curl wget \
  openssh-server \
  git
sudo apt autoremove
```
