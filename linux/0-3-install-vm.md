# install VirtualMachine

Both WSL1 and WSL2 add some weird network & fs hack to smuggle data ins and outs.

So use HyperV directly (or other VM software like VirtualBox) can be better when config dives deeper,
and backup/reuse is easier as whole system is in one huge file.

The idea is config a VM with an additional local 10.42.1.X network, for host to,
everything else is by default separated, like net & fs.

So this VM will have two network switch/device connected:
- an external network, random ip, for connect to Internet
- a internal/local network, on 10.42.1.X ip range: gate at 10.42.1.0, host should be at 10.42.1.1 and VM at 10.42.1.2

Here are the additional config required in VM linux:

```shell
# /etc/systemd/network/00-local-10.42.1.2.network

[Match]
MACAddress=00:00:22:22:44:44
# Name=eth1
# Name=enp0s8

[Network]
DHCP=no
LinkLocalAddressing=no

[Address]
Address=10.42.1.2/24
Scope=host
```

Note in the `Match` section, a static mac address is simpler to set from host side,
the net device name may change.
