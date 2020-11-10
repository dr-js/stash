# `docker`

just follow: https://docs.docker.com/engine/install/


#### WSL2

for WSL2 Debian extra patch will be needed: https://github.com/microsoft/WSL/discussions/4872#discussioncomment-76635
  mainly add: `sudo update-alternatives --set iptables /usr/sbin/iptables-legacy`,
  then start with `sudo containerd` and `sudo dockerd` should work,
  and pass common `http_proxy` env to `dockerd` to use proxy
