# Data sharing host/client setup

check this directory on linux-like file system that support symlink

currently user is locked to `root`, and the path is locked to `/root/*` and `/mnt/*`

there's 3 type of data directory:
- `/root/data-local/`: local on each server, use as fast cache or for server-unique data 
- `/root/data-host/`: only on host server, the source of `/mnt/data-link/`
- `/mnt/data-link/`: symlink(host) or remote-mount(client) link to `/root/data-host/`

the sample base structure:
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

#### `data-host/` directory

should be used as `/root/data-host/` on host server

setup command for host server:
```shell script
# pull repo from web
mkdir -p "/root/data-host/__setup/"
wget "https://github.com/dr-js/stash/archive/master.tar.gz" -O "/root/data-host/__setup/stash-master.tgz"
tar -xf "/root/data-host/__setup/stash-master.tgz" --strip-components 1 -C "/root/data-host/__setup/"

# copy to root & clear downloaded file
cp -r "/root/data-host/__setup/server/data-host/"* "/root/data-host/"
rm -rf "/root/data-host/__setup/"

# search for "TODO: CONFIG HERE" & delete mark & and place in actual info
if grep "TODO: CONFIG HERE" -rn "/root/data-host/"; then # sanity check
  echo "should search & place in actual info where marked 'TODO: CONFIG HERE'"
  exit 1
fi

# then do the setup
bash "/root/data-host/00-init/setup-host.sh"
```

for client server:
```shell script
# pull init script from web
mkdir -p "/root/data-client-init/"
wget "https://github.com/dr-js/stash/raw/master/server/data-host/00-init/[init]common.sh" -O "/root/data-client-init/[init]common.sh"
wget "https://github.com/dr-js/stash/raw/master/server/data-host/00-init/setup-client.sh" -O "/root/data-client-init/setup-client.sh"

# search for "TODO: CONFIG HERE" & delete mark & and place in actual info
if grep "TODO: CONFIG HERE" -rn "/root/data-client-init/"; then # sanity check
  echo "should search & place in actual info where marked 'TODO: CONFIG HERE'"
  exit 1
fi

# then do the setup
bash "/root/data-client-init/setup-client.sh"
```

#### layered data directory

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
