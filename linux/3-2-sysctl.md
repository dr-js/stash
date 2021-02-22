# `sysctl`


check TCP bbr:
```shell script
sudo lsmod | grep bbr
# if output no bbr then:
sudo modprobe tcp_bbr
echo "tcp_bbr" >> /etc/modules-load.d/modules.conf
```

then `sudo nano /etc/sysctl.conf`
and add:

```shell script
# sysctl.conf - Configuration file for setting system variables
# check: https://klaver.it/linux/sysctl.conf


###
### IMPROVE SYSTEM MEMORY MANAGEMENT ###
###

# Increase size of file handles and inode cache
fs.file-max = 262144

# Do less swapping
vm.swappiness = 20
vm.dirty_ratio = 40
vm.dirty_background_ratio = 2

# Keep at least 64MB of free RAM space available
vm.min_free_kbytes = 65535


###
### GENERAL NETWORK SECURITY OPTIONS ###
###

#Prevent SYN attack, enable SYNcookies (they will kick-in when the max_syn_backlog reached)
net.ipv4.tcp_syncookies = 1
net.ipv4.tcp_syn_retries = 2
net.ipv4.tcp_synack_retries = 2
net.ipv4.tcp_max_syn_backlog = 4096

# Decrease the time default value for tcp_fin_timeout connection
net.ipv4.tcp_fin_timeout = 7

# Decrease the time default value for connections to keep alive
net.ipv4.tcp_keepalive_time = 120
net.ipv4.tcp_keepalive_intvl = 15
net.ipv4.tcp_keepalive_probes = 5

# Enable a fix for RFC1337 - time-wait assassination hazards in TCP
net.ipv4.tcp_rfc1337 = 1


###
### TUNING NETWORK PERFORMANCE ###
###

# Use BBR TCP congestion control and set tcp_notsent_lowat to 16384 to ensure HTTP/2 prioritization works optimally
# Do a 'modprobe tcp_bbr' first (kernel > 4.9)
net.ipv4.tcp_congestion_control = bbr
net.ipv4.tcp_notsent_lowat = 16384

# For servers with tcp-heavy workloads, enable 'fq' queue management scheduler (kernel > 3.12)
net.core.default_qdisc = fq

# Increase the read-buffer space allocatable
net.ipv4.tcp_rmem = 8192 87380 16777216
net.ipv4.udp_rmem_min = 16384
net.core.rmem_default = 262144
net.core.rmem_max = 16777216

# Increase the write-buffer-space allocatable
net.ipv4.tcp_wmem = 8192 65536 16777216
net.ipv4.udp_wmem_min = 16384
net.core.wmem_default = 262144
net.core.wmem_max = 16777216

# Increase number of incoming connections
net.core.somaxconn = 32768

# Increase number of incoming connections backlog
net.core.netdev_max_backlog = 16384
net.core.dev_weight = 64

# Increase the maximum amount of option memory buffers
net.core.optmem_max = 65535

# Increase the tcp-time-wait buckets pool size to prevent simple DOS attacks
net.ipv4.tcp_max_tw_buckets = 1440000

# try to reuse time-wait connections
net.ipv4.tcp_tw_reuse = 1

# Avoid falling back to slow start after a connection goes idle
# keeps our cwnd large with the keep alive connections (kernel > 3.6)
net.ipv4.tcp_slow_start_after_idle = 0

# Allow the TCP fastopen flag to be used, beware some firewalls do not like TFO! (kernel > 3.7)
net.ipv4.tcp_fastopen = 3
```

apply change with `sudo sysctl -p`

check result with:
```shell script
sysctl net.ipv4.tcp_available_congestion_control
sysctl net.ipv4.tcp_congestion_control
```

increase process max open file with: `sudo nano /etc/security/limits.conf`
and add:
```shell script
*   soft    nproc     4096
*   hard    nproc     4096
*   soft    nofile    65536
*   hard    nofile    65536
```

test `nofile` with `ulimit -n`
