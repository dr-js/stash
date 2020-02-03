# SSH


should be pre-installed, check for command `ssh` and `sshd`, or install with:
```shell script
sudo apt install openssh-client openssh-server -y
sudo systemctl enable sshd.service # enable server
sudo systemctl status sshd.service # check status
```


#### `~/.ssh/`

```shell script
mkdir -p ~/.ssh/

nano ~/.ssh/authorized_keys # add public key in nano
chmod 600 ~/.ssh/authorized_keys

# for key file mode:
chmod 644 ~/.ssh/*.pub # for public key
chmod 600 ~/.ssh/*.pri # for private key
```


#### `/etc/ssh/sshd_config`

config `sshd` to allow only ssh key login: 
```shell script
sudo nano /etc/ssh/sshd_config
```

important lines:
```shell script
Port 22 # consider change to port like 22222 to skip most port scan

PermitRootLogin prohibit-password
StrictModes yes
LoginGraceTime 10 # in seconds, default: 2m
MaxAuthTries 2

PubkeyAuthentication yes    # for ssh key login
PermitEmptyPasswords no
PasswordAuthentication no   # no password login
```

check network config:
```shell script
cat /etc/netplan/*
cat /etc/network/interfaces
cat /etc/resolv.conf
```

disable ubuntu MOTD:
```shell script
grep motd /etc/pam.d/* # then comment out all lines
```

reload `sshd` to apply config:
```shell script
sudo systemctl reload sshd
```
