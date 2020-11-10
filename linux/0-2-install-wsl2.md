# install WSL2

It's a level-3 inception: `docker` in WSL2-Debian in Win10, and it's actually pretty good,
  with the help of [VcXsrv](https://sourceforge.net/projects/vcxsrv/).

## setup

WSL2, despite based on hyperV, is usable from all Win10, Home edition included.

Just start from here: https://docs.microsoft.com/en-us/windows/wsl/compare-versions

Notes:
- `wsl --set-default-version 2` before downloading `Debian` for the store.
- the default user can be changed with `debian.exe config --default-user USER_NAME`,
    so the first user can be only used for bootstrapping and then be dropped.

#### Fix `Vmmem` use up all memory

This is a funny one:
- the memory is shared between Win10 & WSL2
- Linux use free memory as file cache

So result is the Linux in WSL2 will eat-up all host memory, and those cache cannot be freed from host.
The solution is to limit the max memory for WSL, with: https://docs.microsoft.com/en-us/windows/wsl/wsl-config#wsl-2-settings

#### Fast systemd replacement script

The WSL version of linux do not run systemd, and that's why it's fast.
But develop and even daily use of Linux without "service" is painful.
With the help of `screen`, something script like below should work like a service:
```shell script
# init for WSL2 Debian

sudo bash <<"EOF"

# all should run as root
shopt -s expand_aliases # allow alias
source ~/.bash_aliases_extend # load alias

# sshd
mkdir -p "/run/sshd"
screen -ls sshd || screen -S sshd -dm "$(which sshd)" -D

# shadowsocks-libev local
screen -ls ss-local || screen -S ss-local -dm "$(which ss-local)" -c /etc/shadowsocks-libev/local-config.json

# privoxy
screen -ls privoxy || screen -S privoxy -dm "$(which privoxy)" --no-daemon /etc/privoxy/config

# dockerd(+proxy) & containerd
screen -ls containerd || screen -S containerd -dm "$(which containerd)"
screen -ls dockerd || PX1 NO_PROXY=localhost,127.0.0.1 screen -S dockerd -dm "$(which dockerd)"

EOF
```

#### Note on why VcXsrv is a good fit

SSH X11 forward is simple and fantastic, sadly there's a but - hint: check your bandwidth - it's limited by the network.
With a 1Gbps cable, daily work is fine, with WIFI6 and a 1080p screen size it's still okay,
  but to stably support low latency and deal with the random 100Mbps surge is not easy.
The WSL2 is the missing piece, all network is inside on box, so the problem is gone.
