# Bash profile Termux

```shell script
# =============================
# env path fix, check "https://github.com/termux/termux-packages/issues/1192"
PATH_ENV=`which env`
alias proot-env="proot -b ${PATH_ENV}:/usr/bin/env"
alias proot-env-link="proot -b ${PATH_ENV}:/usr/bin/env --link2symlink"

alias PE=proot-env
alias PEL=proot-env-link

alias sudo="SU=1" # already sudo, do nothing, just patch the command for other to work
```
