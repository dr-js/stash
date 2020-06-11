# setup with:
#   (echo "" > ~/.bash_aliases_extend_termux) && nano ~/.bash_aliases_extend_termux # reset the file and open for edit
# then add to `~/.bashrc`: (default ubuntu `.bashrc` may be found at `/etc/skel/.bashrc`)
#   [[ -f ~/.bash_aliases_extend_termux ]] && . ~/.bash_aliases_extend_termux

# =============================
# mark version
alias bash-aliases-extend-termux-version='echo 0.1.4'

alias BAETV=bash-aliases-extend-termux-version

# =============================
# already sudo of this shell, do nothing, just patch the command for other to work
# remove this if the Android is rooted and use the patched su/sudo instead
alias sudo='SU=1'

# =============================
# TODO: NOTE: now seems it's not needed
# env path fix, check "https://github.com/termux/termux-packages/issues/1192"
alias proot-env='proot -b "$(which env):/usr/bin/env"'
alias proot-env-link='proot -b "$(which env):/usr/bin/env" --link2symlink'

alias PE=proot-env
alias PEL=proot-env-link
