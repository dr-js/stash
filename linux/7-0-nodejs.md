# `nodejs`

install `nodejs` and `npm`:
```shell script
( # arch
  sudo pacman -S nodejs --noconfirm # NOTE: not install npm from arch
  # DIY npm (refer to: https://www.archlinux.org/packages/community/any/npm/files/)
  #   arch split `npm/semver/node-gyp` to separate package, mix `pacman -Syu` with `npm i -g npm` will be messy,
  #   check: https://www.archlinux.org/packages/community/any/npm/
  mkdir ~/DIY_NPM/
  ( cd ~/DIY_NPM/
    wget https://registry.npmjs.org/npm/-/npm-6.14.5.tgz # find latest version from: npm.im/npm, or with: `npm view npm`
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

( # ubuntu, check: https://github.com/nodesource/distributions/blob/master/README.md#debinstall
  curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash - # common node.js install
  sudo apt install nodejs -y
)

npm config set update-notifier false # stop npm spawn many un-finishing update checking process
```

optionally setup `npm` proxy through `shadowsocks + privoxy`, check: linux/9-9-proxy-config.md