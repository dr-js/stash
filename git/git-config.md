lighter git clone: 
- `git clone -b master --single-branch git@github.com:dr-js/dr-js.git`
- `git clone <url> --branch <branch> --single-branch <folder>`

lighter git config:
```ini
[core]
  filemode = false # ignore file permission change (for win32 repo)
  bare = false
  symlinks = false
  ignorecase = false # force case-sensitive path (good for win32/darwin repo)
  
  # new EOL will be '\n', existing EOL will be kept
  autocrlf = input
  eol = lf

  # use non-default ssh key
  sshCommand = ssh -i ~/.ssh/SOME-SPECIFIC-KEY.pri 
[remote "origin"]
  url = git@github.com:dr-js/dr-js.git
  # url = [git@some.other.proxy.com:22]:dr-js/dr-js.git # short syntax for adding port
  tagOpt = --no-tags # do not fetch tags
  fetch = +refs/heads/master:refs/remotes/origin/master
  fetch = +refs/heads/dr/*:refs/remotes/origin/dr/*
  # fetch = +refs/heads/*:refs/remotes/origin/* # do not fetch all branches
[branch "master"]
  remote = origin
  merge = refs/heads/master
[branch "branch-a"]
  remote = origin
  merge = refs/heads/branch-a
...
```

git ssh through proxy, edit `nano ~/.ssh/config`:

for http proxy: 
- with `connect`: (`apt install connect-proxy`)
    ```shell script
    Host github.com
      IdentityFile ~/.ssh/github_rsa
      ProxyCommand connect -H 127.0.0.1:1080 %h %p
    ```

for socks5 proxy: (check: https://unix.stackexchange.com/questions/416010/ssh-through-shadowsocks)
- with `connect`:
    ```shell script
    Host github.com
      IdentityFile ~/.ssh/github_rsa
      ProxyCommand connect -S 127.0.0.1:1080 %h %p
    ```
- or with `nc`:
    ```shell script
    Host github.com
      IdentityFile ~/.ssh/github_rsa
      ProxyCommand nc -X 5 -x 127.0.0.1:1080 %h %p
    ```
