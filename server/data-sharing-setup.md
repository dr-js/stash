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

NOTE: search for `TODO: CONFIG HERE` to and place in actual info before deploy to server

the full content for `/root/data-host/`



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
