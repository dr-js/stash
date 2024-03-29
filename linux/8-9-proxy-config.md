# common proxy config

here assume we have: (replace with actual port)
- HTTP proxy at: `127.0.0.1:00_HTTP_PORT_00`
- SOCKS5 proxy at: `127.0.0.1:00_SOCKS5_PORT_00`


#### ssh

`nano ~/.ssh/config` add for each ssh host:
for http proxy: 
- with `connect`: (`apt install connect-proxy` and bundled with win32 `git-bash`)
    ```
    Host github.com
      IdentityFile ~/.ssh/github_rsa
      ProxyCommand connect -H 127.0.0.1:00_HTTP_PORT_00 %h %p
    ```

for socks5 proxy: (check: https://unix.stackexchange.com/questions/416010/ssh-through-shadowsocks)
- with `connect`:
    ```
    Host github.com
      IdentityFile ~/.ssh/github_rsa
      ProxyCommand connect -S 127.0.0.1:00_SOCKS5_PORT_00 %h %p
    ```
- or with `nc`: (`pacman -S openbsd-netcat` or `apt i netcat-openbsd`)
    ```
    Host github.com
      IdentityFile ~/.ssh/github_rsa
      ProxyCommand nc -X 5 -x 127.0.0.1:00_SOCKS5_PORT_00 %h %p
    ```


#### git

`nano ~/.gitconfig` add:
```
# this is only for http-based repo, for ssh-based proxy set like above
[http]
	proxy = socks5://127.0.0.1:00_SOCKS5_PORT_00
[https]
	proxy = socks5://127.0.0.1:00_SOCKS5_PORT_00
```
some bonus:
```
[core]
	autocrlf = input
	eol = lf
```


#### `npm`

```
sudo npm config set --global noproxy=127.0.0.1,localhost # exclude localhost
sudo npm config set --global proxy=http://127.0.0.1:1080 # for http
sudo npm config set --global https-proxy=http://127.0.0.1:1080 # for https
```
`nano ~/.npmrc` add:
```
noproxy=127.0.0.1,localhost # exclude localhost
proxy=http://127.0.0.1:00_HTTP_PORT_00 # for http
https-proxy=http://127.0.0.1:00_HTTP_PORT_00 # for https
```
some bonus:
```
update-notifier=false # not spawn sneaky update check process
fetch-retries=5
fetch-retry-mintimeout=4000
fetch-retry-maxtimeout=8000
```


#### `docker`

for docker daemon (`dockerd`):
`sudo mkdir -p /etc/systemd/system/docker.service.d && sudo nano /etc/systemd/system/docker.service.d/http-proxy.conf`
and add:
```
# use local http proxy
# check: https://docs.docker.com/config/daemon/systemd/#httphttps-proxy
[Service]
Environment="HTTP_PROXY=http://127.0.0.1:00_HTTP_PORT_00"
Environment="NO_PROXY=localhost,127.0.0.1,docker-registry.example.com,.corp"
```
then to apply:
```shell script
sudo systemctl daemon-reload
sudo systemctl restart docker
```

for docker container:
check: https://docs.docker.com/network/proxy/#configure-the-docker-client
and edit `~/.docker/config.json`


#### `apt` (debian/ubuntu/raspbian)

`sudo nano /etc/apt/apt.conf.d/70debconf` add:
```
# use local http proxy
Acquire::http::Proxy "http://127.0.0.1:00_HTTP_PORT_00";
```
