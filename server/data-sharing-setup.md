# Data sharing host/client setup

check this directory on linux-like file system that support symlink

currently user is locked to `root`, and the path is locked to `/root/*` and `/mnt/*`

there's 3 type of data directory:
- `/root/data-local/`: local on each server, use as fast cache or for server-unique data 
- `/root/data-host/`: only on host server, the source of `/mnt/data-link/`
- `/mnt/data-link/`: symlink(host) or remote-mount(client) link to `/root/data-host/`

## sample base structure
```
$ tar -xf sample.tar
$ tree sample-gitignore/
sample-gitignore/
├── client-server
│   ├── mnt
│   │   ├── data-link -> ../../host-server/root/data-host
│   │   └── NOTE here the symlink represents a remote-mount
│   └── root
│       └── data-local
│           ├── private
│           │   └── public
│           │       └── share
│           ├── public -> private/public
│           └── share -> private/public/share
└── host-server
  ├── mnt
  │   └── data-link -> ../root/data-host
  └── root
      ├── data-host
      │   ├── private
      │   │   └── public
      │   │       └── share
      │   ├── public -> private/public
      │   └── share -> private/public/share
      └── data-local
          ├── private
          │   └── public
          │       └── share
          ├── public -> private/public
          └── share -> private/public/share
```

## `./data-host/` directory

will be `/root/data-host/` on host server,
the file start with `00-99` will get reset during host setup,
so keep config in `/root/data-host/host-config.json`,
and keep data in `/root/data-host/private` (including `public|share`)

#### `00-init/setup-host.sh` for host server
```shell script
# pull repo from web
mkdir -p "/root/data-host/__setup/"
wget "https://github.com/dr-js/stash/archive/master.tar.gz" -O "/root/data-host/__setup/stash-master.tgz"
tar -xf "/root/data-host/__setup/stash-master.tgz" --strip-components 1 -C "/root/data-host/__setup/"

# update to root & clear downloaded file
rm -rf "/root/data-host/"[0-9]*
cp -r "/root/data-host/__setup/server/data-host/"[0-9]* "/root/data-host/"
rm -rf "/root/data-host/__setup/"

# TODO: NOTE: up till now should be enough to update file to latest, and the existing config will stay the same

# init host config
FILE_HOST_CONFIG="/root/data-host/host-config.json"
if [[ -f "${FILE_HOST_CONFIG}" ]]; then echo "host config exist"
else echo "create default host config"
  mkdir -p "/root/data-host/"
  cat > "${FILE_HOST_CONFIG}" <<- 'EOM'
    {
      "// host config": "should keep this file updated, will be used in both host client server",

      "// 20-cert-letsencrypt-email": "email for cert renew",
      "20-cert-letsencrypt-email": "TODO: CONFIG HERE",

      "// 50-server-*": "optional config overwrite, avoid use relative path",
      "50-server-dr-js": {},
      "50-server-dr-node": {},
      "50-server-dr-run": {},

      "// 51-shadowsocks-config": "default config for all server",
      "51-shadowsocks-config": {
        "server": [ "::", "0.0.0.0" ],
        "server_port": 12345,
        "password": "TODO: CONFIG HERE",
        "method": "chacha20-ietf-poly1305",
        "mode": "tcp_and_udp",
        "timeout": 1000,
        "fast_open": true,
        "acl": "/etc/shadowsocks-libev/server_block_local.acl"
      }
    }
EOM
fi

# search for "TODO: CONFIG HERE" & delete mark & and place in actual info
if grep "TODO: CONFIG HERE" -n "${FILE_HOST_CONFIG}"
then echo "should search & place in actual info where marked 'TODO: CONFIG HERE'" # sanity check
else bash "/root/data-host/00-init/setup-host.sh" # do the setup
fi
```

#### `00-init/setup-client.sh` for client server
```shell script
# pull init script from web
mkdir -p "/root/data-client-init/"
wget "https://github.com/dr-js/stash/raw/master/server/data-host/00-init/[init]common.sh" -O "/root/data-client-init/[init]common.sh"
wget "https://github.com/dr-js/stash/raw/master/server/data-host/00-init/setup-client.sh" -O "/root/data-client-init/setup-client.sh"

# init client config
FILE_CLIENT_CONFIG="/root/data-client-init/client-config.json"
if [[ -f "${FILE_CLIENT_CONFIG}" ]]; then echo "client config exist"
else echo "create default client config"
  cat > "${FILE_CLIENT_CONFIG}" <<- 'EOM'
    {
      "// client config": "one-time config file, for connecting to host server",

      "// client-ssh-hostname": "hostname or ip to the host server, for client server sshfs setup",
      "client-ssh-hostname": "TODO: CONFIG HERE",

      "// client-ssh-prot": "for non-default ssh port",
      "client-ssh-port": 22
    }
EOM
fi

# search for "TODO: CONFIG HERE" & delete mark & and place in actual info
if grep "TODO: CONFIG HERE" -n "${FILE_CLIENT_CONFIG}"
then echo "should search & place in actual info where marked 'TODO: CONFIG HERE'" # sanity check
else bash "/root/data-client-init/setup-client.sh" # do the setup
fi
```

## layered data directory

for a clear data access directory structure, consider using a 3-layered structure `./private/public/share/`:
- `private/`: not public accessible, auth required
- `public/`: public accessible, but no listing
- `share/`: public accessible, with listing

sample code to create the structure, with symlink for quick access: 
```shell script
cd some/where/data/
mkdir -p private/public/share/
ln -sfT private/public public
ln -sfT private/public/share share
```

the result structure:
```
$ tree
.
├── private
│   └── public
│       └── share
├── public -> private/public
└── share -> private/public/share
```
