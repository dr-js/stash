# setup with:
#   (echo "" > ~/.bash_aliases_extend_arch) && nano ~/.bash_aliases_extend_arch # reset the file and open for edit
# then add to `~/.bashrc`:
#   [[ -f ~/.bash_aliases_extend_arch ]] && . ~/.bash_aliases_extend_arch

# =============================
# mark version
alias bash-aliases-extend-arch-version='echo 0.2.0'

alias BAEAV=bash-aliases-extend-arch-version

# =============================
# pacman aliases (P*)
alias pacman-list-all='sudo pacman -Q'
alias pacman-list='sudo pacman -Qe' # explicitly installed
alias pacman-update='sudo pacman -Syu && sudo pacman -Rns $(pacman -Qtdq)'
alias pacman-install='sudo pacman -S'
alias pacman-remove='sudo pacman -R'

alias PLA=pacman-list-all
alias PL=pacman-list
alias PU=pacman-update
alias PR=pacman-remove
alias PI=pacman-install

# =============================
# quick path alias (C*)
alias cd-shadowsocks="cd /etc/shadowsocks/"

alias CSS=cd-shadowsocks
