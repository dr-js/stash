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
