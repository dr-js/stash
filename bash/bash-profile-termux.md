# Bash profile Termux

```shell script
# =============================
# already sudo of this shell, do nothing, just patch the command for other to work
# remove this if the Android is rooted and use the patched su/sudo instead
alias sudo="SU=1"

# =============================
# TODO: NOTE: now seems it's not needed
# env path fix, check "https://github.com/termux/termux-packages/issues/1192"
PATH_ENV=`which env`
alias proot-env="proot -b ${PATH_ENV}:/usr/bin/env"
alias proot-env-link="proot -b ${PATH_ENV}:/usr/bin/env --link2symlink"

alias PE=proot-env
alias PEL=proot-env-link
```
