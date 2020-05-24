# setup with:
#   (echo "" > ~/.bash_aliases_extend_ubuntu) && nano ~/.bash_aliases_extend_ubuntu # reset the file and open for edit
# then add to `~/.bashrc`:
#   [[ -f ~/.bash_aliases_extend_ubuntu ]] && . ~/.bash_aliases_extend_ubuntu

# =============================
# mark version
alias bash-aliases-extend-ubuntu-version='echo 0.2.0'

alias BAEUV=bash-aliases-extend-ubuntu-version

# =============================
# apt aliases (A*)
alias apt-list-installed='sudo apt list --installed'
alias apt-update='sudo apt update && sudo apt upgrade -y && sudo apt autoremove --purge -y'
alias apt-install='sudo apt install'
alias apt-remove='sudo apt autoremove --purge'

alias AL=apt-list-installed
alias AU=apt-update
alias AI=apt-install
alias AR=apt-remove

# =============================
# system aliases (S*)
alias system-reboot-required='sudo ls /var/run/reboot-required'
alias system-queue-reboot-4am='echo "sudo reboot" | sudo at 4am'

alias SRR=system-reboot-required
alias SQR4AM=system-queue-reboot-4am

## sudo at -l           # list pending job
## sudo at -c <jobId>   # print job command

# =============================
# quick path alias (C*)
alias cd-shadowsocks="cd /etc/shadowsocks-libev/"

alias CSS=cd-shadowsocks
