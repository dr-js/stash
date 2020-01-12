# Data sharing host/client setup

check this directory on linux-like file system that support symlink

currently user is locked to `root`, and the path is locked to `/root/*` and `/mnt/*`

there's 3 type of data directory:
- `/root/data-local/`: local on each server, use as fast cache or for server-unique data 
- `/root/data-host/`: only on host server, the source of `/mnt/data-link/`
- `/mnt/data-link/`: symlink(host) or remote-mount(client) link to `/root/data-host/`

the sample structure:
```
data-host-client$ tar -xf sample.tar
data-host-client$ tree *-server
client-server
├── mnt
│   ├── data-link -> ../../host-server/root/data-host
│   └── NOTE here the symlink represents a remote-mount
└── root
    └── data-local
        ├── private
        │   └── public
        │       └── share
        ├── public -> private/public
        └── share -> private/public/share
host-server
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
