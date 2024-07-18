# `docker`

just follow: https://docs.docker.com/engine/install/

#### prevent log bloats
check: https://docs.docker.com/config/containers/logging/configure/#configure-the-default-logging-driver
basically run `sudo mkdir -p /etc/docker/ && sudo nano /etc/docker/daemon.json` and add:
```json
{
  "experimental": true, "features": { "buildkit": true },
  "log-driver": "json-file", "log-opts": { "max-size": "8m", "max-file": "4" }
}
```
Note: should restart `dockerd`, and re-create existing container for default log config to fully apply

```json5
{
  // change root
  "data-root": "/mnt/some-disk/docker",

  // enable latest features
  "experimental": true, "features": { "buildkit": true }
}
```

#### install `docker-compose@2`

use docker-compose V2 for faster compose
https://docs.docker.com/compose/install/standalone/

```shell
sudo curl \
  -L "https://github.com/docker/compose/releases/download/v2.29.0/docker-compose-linux-$(uname -m)" \
  -o "/usr/local/bin/docker-compose"
sudo chmod +x "/usr/local/bin/docker-compose"
docker-compose -v
```

    #### install `docker-compose@1.29.2`
    
    because docker-compose V2 is still not stable & reasonable enough (20220825)
    
    ```shell
    sudo curl \
      -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-Linux-$(uname -m)" \
      -o "/usr/local/bin/docker-compose"
    sudo chmod +x "/usr/local/bin/docker-compose"
    [[ -f /usr/lib/libcrypt.so.1 ]] || ( echo 'missing "/usr/lib/libcrypt.so.1"'; ls -al /usr/lib/libcrypt.*; sudo ln -sfT libcrypt.so /usr/lib/libcrypt.so.1 ) # patch old python lib for arch-linux
    docker-compose -v
    ```

#### WSL2

for WSL2 Debian extra patch will be needed: https://github.com/microsoft/WSL/discussions/4872#discussioncomment-76635
  mainly add: `sudo update-alternatives --set iptables /usr/sbin/iptables-legacy`,
  then start with `sudo containerd` and `sudo dockerd` should work,
  and pass common `http_proxy` env to `dockerd` to use proxy
