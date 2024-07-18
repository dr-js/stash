# `nodejs`

install `nodejs` and `npm`:
```shell script
( # arch
  sudo pacman -S nodejs --noconfirm # NOTE: not install `npm` from pacman
  # DIY npm (refer to: https://www.archlinux.org/packages/community/any/npm/files/)
  #   arch split `npm/semver/node-gyp` to separate package, mix `pacman -Syu` with `npm i -g npm` will be messy,
  #   so the DIY install here will only use npm self update
  mkdir ~/DIY_NPM/
  ( cd ~/DIY_NPM/
    wget https://registry.npmjs.org/npm/-/npm-9.9.3.tgz # find latest version from: npm.im/npm, or with: `npm view npm`
    tar xf ./*.tgz # extract
    sudo mkdir -p /usr/lib/node_modules/ # `sudo rm -rf /usr/lib/node_modules/`
    sudo cp -rT ./package /usr/lib/node_modules/npm
    # setup bin symlink, from existing install: `ll /usr/bin/np*`
    #   lrwxrwxrwx 1 root root    38 May 23 18:01 npm -> ../lib/node_modules/npm/bin/npm-cli.js*
    #   lrwxrwxrwx 1 root root    38 May 23 18:01 npx -> ../lib/node_modules/npm/bin/npx-cli.js*
    sudo ln -sfT "../lib/node_modules/npm/bin/npm-cli.js" /usr/bin/npm
    sudo ln -sfT "../lib/node_modules/npm/bin/npx-cli.js" /usr/bin/npx
  )
  rm -rf ~/DIY_NPM/
)

( # debian/ubuntu, check: https://github.com/nodesource/distributions/blob/master/README.md#using-debian-as-root-nodejs-22
  curl -sL https://deb.nodesource.com/setup_22.x | sudo -E bash - # common node.js install
  sudo apt-get install nodejs -y
)

# stop npm spawn many un-finishing update checking process
sudo npm config set --global update-notifier false # for `sudo npm i -g`
```

cn mirror: https://npmmirror.com/
optionally setup `npm` proxy through `shadowsocks + privoxy`, check: `./8-9-proxy-config.md`
