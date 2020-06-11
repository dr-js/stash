# install Chrome Remote Desktop

It's AUR, so check first: https://wiki.archlinux.org/index.php/Arch_User_Repository

The AUR package: https://aur.archlinux.org/packages/chrome-remote-desktop/

Build and install as normal.

The actual setup step is a little different from: https://aur.archlinux.org/packages/chrome-remote-desktop/#pinned-719586

To set `http_proxy` for exchanging Auth to google server:
- run `crd --setup`
- Configure execution of your preferred window manager in `~/.chrome-remote-desktop-session`
    (will prompt in above output, need install an X11 window manager at least, or the bigger desktop manager, if both missing the generated file will have no X11 init command inside)
- Finish the auth token generation in: `http://remotedesktop.google.com/headless`
    (on the result string matters, can use another device with a browser)
- Copy/paste and run the provided "Debian" command, which should look like the following:
    `DISPLAY= /opt/google/chrome-remote-desktop/start-host --code="<UNIQUE_CODE>" --redirect-url="<https://remotedesktop.google.com/_/oauthredirect>" --name=`
    (here appending `http_proxy` should work)
- Set up a name and PIN, then wait for successful output containing `Host ready to receive connections.`
- To start the host server with `http_proxy`, the handy `crd --start` python script need to be bypassed, since the env gets dropped when the actual host is spawn.
    To get the inner command, you can run `crd --start` once and check the `htop` or `ps` for the inner command, should be like:
    `/opt/google/chrome-remote-desktop/chrome-remote-desktop --start --child-process --config=/home/<USER>/.config/chrome-remote-desktop/host#<HASH-HASH-HASH>.json --size=1920x1080 --start`
    copy that and provide the env, start with `screen` like:
    ```shell script
    http_proxy=http://127.0.0.1:99999 \
      screen -S crd.host -dm \
      /opt/google/chrome-remote-desktop/chrome-remote-desktop --start --child-process --config=/home/<USER>/.config/chrome-remote-desktop/host#<HASH-HASH-HASH>.json --size=1920x1080 --start
    ```
