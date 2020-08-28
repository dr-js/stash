# setup with:
#   (echo "" > ~/.bash_aliases_extend) && nano ~/.bash_aliases_extend # reset the file and open for edit
# then add to `~/.bashrc`
#   [[ -f ~/.bash_aliases_extend ]] && . ~/.bash_aliases_extend

# =============================
# mark version
alias bash-aliases-extend-version='echo 0.3.2'

alias BAEV=bash-aliases-extend-version

# =============================
# ls aliases (l*)
alias llh='ls -ahlF'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# =============================
# screen clear aliases, should be supported in xterm/VT100
alias CLS='clear && printf "\e[3J"'

# =============================
# cd aliases (c*)
alias cb='cd ../'
alias cbb='cd ../../'
alias cbbb='cd ../../../'
alias cbbbb='cd ../../../../'

# =============================
# git aliases (G*)
alias git-fetch='git fetch'
alias git-git-combo='git fetch --prune' # no `--prune-tags`
alias git-git-git-combo='git fetch --prune && git gc --auto'
alias git-git-git-git-combo='git fetch --prune && git gc --prune=now'
alias git-status='git status'
alias git-push='git push'
alias git-reset-hard='git reset --hard @{upstream}'
alias git-git-reset-head='git-git-combo && git-reset-hard'
alias git-branch-delete='git branch -D'
alias git-branch-checkout='git checkout -B'
function git-cherry-pack-range { git cherry-pick "$1"^.."$2"; } # $1=commit-from, $1=commit-to # will include both from/to commit
alias git-cherry-pack-abort='git cherry-pick --abort'
alias git-cherry-pack-continue='git cherry-pick --continue'
alias git-clear='git remote prune origin && git gc --prune=now'
alias git-tag-clear-local='git tag -d $(git tag -l)'
alias git-ls-files-stage='git ls-files --stage'
alias git-update-644='git update-index --chmod=-x'
alias git-update-755='git update-index --chmod=+x'
alias git-log='git log'
alias git-log-16='git-log -16'
alias git-log-oneline='git log --date=short --pretty=format:"%C(auto,yellow)%h %C(auto,blue)%>(12,trunc)%ad %C(auto,green)%<(7,trunc)%aN%C(auto,reset)%s%C(auto,red)% gD% D"'
alias git-log-oneline-16='git-log-oneline -16'
alias git-log-graph='git log --graph --oneline'
alias git-log-graph-16='git-log-graph -16'
alias git-trace='GIT_TRACE=1'

alias G=git-fetch
alias GG=git-git-combo
alias GGG=git-git-git-combo
alias GGGG=git-git-git-git-combo
alias GS=git-status
alias GP=git-push
alias GRH=git-reset-hard
alias GGRH=git-git-reset-head
alias GBD=git-branch-delete
alias GBC=git-branch-checkout
alias GCPR=git-cherry-pack-range
alias GCPA=git-cherry-pack-abort
alias GCPC=git-cherry-pack-continue
alias GC=git-clear
alias GTCL=git-tag-clear-local
alias GLS=git-ls-files-stage
alias G644=git-update-644
alias G755=git-update-755
alias GL=git-log
alias GL16=git-log-16
alias GLO=git-log-oneline
alias GLO16=git-log-oneline-16
alias GLG=git-log-graph
alias GLG16=git-log-graph-16
alias GT=git-trace

# =============================
# systemd aliases (SD*)
alias systemd-list-active='sudo systemctl list-units --type=service --state=active'
alias systemd-list-enabled='sudo systemctl list-unit-files --type=service --state=enabled,generated'
alias systemd-list-timers='sudo systemctl list-timers'
alias systemd-daemon-reload='sudo systemctl daemon-reload'
alias systemd-start='sudo systemctl start'
alias systemd-stop='sudo systemctl stop'
alias systemd-status='sudo systemctl status'
alias systemd-enable='sudo systemctl enable'
alias systemd-disable='sudo systemctl disable'
alias systemd-restart='sudo systemctl restart'
alias systemd-reload='sudo systemctl reload'
# TODO: add reset failed from: https://serverfault.com/questions/606520/how-to-remove-missing-systemd-units

alias SDLA=systemd-list-active
alias SDLE=systemd-list-enabled
alias SDLT=systemd-list-timers
alias SDDR=systemd-daemon-reload
alias SDON=systemd-start
alias SDOFF=systemd-stop
alias SDS=systemd-status
alias SDE=systemd-enable
alias SDD=systemd-disable
alias SDRS=systemd-restart
alias SDRL=systemd-reload

# =============================
# npm aliases (N*)
alias npm-list-global='npm ls -g --depth=0'
alias npm-install='npm i'
alias npm-install-global='sudo npm i -g'
alias npm-install-prefer-offline='npm i --prefer-offline'
alias npm-install-package-lock-only='npm i --package-lock-only'
alias npm-outdated='npm out'
alias npm-dedup-install='npm ddp && npm i --prefer-offline'
alias npm-audit='npm audit'
alias npm-audit-fix='npm audit fix'

alias NLSG=npm-list-global
alias NI=npm-install
alias NIG=npm-install-global
alias NIO=npm-install-prefer-offline
alias NIPLO=npm-install-package-lock-only
alias NO=npm-outdated
alias NDI=npm-dedup-install
alias NA=npm-audit
alias NAF=npm-audit-fix

# =============================
# screen aliases (S*)
alias screen-resume='screen -R'
alias screen-list='screen -ls'

alias SR=screen-resume
alias SL=screen-list

# =============================
# nano aliases (NN*)
function nano-reset { echo "" > "$1"; nano "$1"; } # $1=file-to-reset-and-edit

alias NNR=nano-reset

# =============================
# quick aliases (Q*)
function quick-dd-random { dd bs=1048576 count="${1:-100}" if=/dev/urandom of="./RANDOM-${1:-100}MiB"; } # $1=size-in-MiB-default-to-100
alias quick-shutdown='sudo shutdown 0'
alias quick-reboot='sudo reboot'
alias quick-df='df -h .'
alias quick-ssh-key-md5-list='ssh-keygen -E md5 -lf ~/.ssh/authorized_keys'
if [[ -d /sys/class/thermal/thermal_zone0 ]]; then
  alias quick-system-watch='watch --no-title "echo == cpufreq ==; cat /sys/devices/system/cpu/cpufreq/policy*/scaling_cur_freq; echo == thermal ==; cat /sys/class/thermal/thermal_zone*/temp;"'
else # if grep -q "cpu MHz" /proc/cpuinfo; then
  alias quick-system-watch='watch --no-title grep \"cpu MHz\" /proc/cpuinfo'
fi

alias QDDR=quick-dd-random
alias QSHUTDOWN=quick-shutdown
alias QREBOOT=quick-reboot
alias QDF=quick-df
alias QSKML=quick-ssh-key-md5-list
alias QSW=quick-system-watch

# =============================
# @dr-js aliases (D*)
alias dr-js-npm-install-global-all='sudo npm i -g @dr-js/core @dr-js/node @dr-js/dev'
alias dr-js-npm-install-global-all-dev='sudo npm i -g @dr-js/core@dev @dr-js/node@dev @dr-js/dev@dev'
alias dr-js-package-reset='dr-js --rm package-lock.json node_modules'

alias DNIGA=dr-js-npm-install-global-all
alias DNIGAD=dr-js-npm-install-global-all-dev
alias DPR=dr-js-package-reset

# =============================
# common path alias (C*)
__PATH_GIT_ROOT_LIST="Git/ GitHub/ Documents/Git/ Documents/GitHub/" # list to search
__PATH_GIT_ROOT=""
for path in ${__PATH_GIT_ROOT_LIST}; do
  [[ -d "${HOME}/${path}" ]] && __PATH_GIT_ROOT="${HOME}/${path}"
done

alias cd-git='cd "${__PATH_GIT_ROOT}"'
alias cd-log='cd /var/log/'
alias cd-systemd='cd /lib/systemd/system/'
alias cd-nginx='cd /etc/nginx/'
alias cd-shadowsocks='cd /etc/shadowsocks*/' # pacman: /etc/shadowsocks/ | apt: /etc/shadowsocks-libev/

alias CG=cd-git
alias CL=cd-log
alias CSD=cd-systemd
alias CN=cd-nginx
alias CSS=cd-shadowsocks

# =============================
# proxy alias (PX*)
__PROXY_HTTP="http://127.0.0.1:1080"
__PROXY_SOCKS5="socks5://127.0.0.1:$(node -e "process.exitCode = Number(os.platform() === 'win32')" && echo "1081" || echo "1080")" # win10 SS support socks5+http in single port, but not on other platform

alias proxy-on='export \
  http_proxy="${__PROXY_HTTP}" \
  https_proxy="${__PROXY_HTTP}" \
  HTTP_PROXY="${__PROXY_HTTP}" \
  HTTPS_PROXY="${__PROXY_HTTP}" \
'
alias proxy-off='unset \
  http_proxy \
  https_proxy \
  HTTP_PROXY \
  HTTPS_PROXY \
'
alias proxy-once=' \
  http_proxy="${__PROXY_HTTP}" \
  https_proxy="${__PROXY_HTTP}" \
  HTTP_PROXY="${__PROXY_HTTP}" \
  HTTPS_PROXY="${__PROXY_HTTP}" \
'

alias PXON=proxy-on
alias PXOFF=proxy-off
alias PX1=proxy-once

# =============================
# =============================
# linux release dependent alias
# =============================
# =============================

## LSB linux: https://serverfault.com/questions/879216/how-to-detect-linux-distribution-and-version/880087#880087
## termux: https://www.reddit.com/r/termux/comments/co46qw/how_to_detect_in_a_bash_script_that_im_in_termux/ewi3fjj/
__LINUX_RELEASE_NAME="$(source /etc/os-release 2> /dev/null && echo "$NAME" || echo "non-LSB")"
[[ "$PREFIX" == *"com.termux"* ]] && __LINUX_RELEASE_NAME="Android (Termux)"

__LINUX_PACKAGE_MANAGER="unknown"
[[ "${__LINUX_RELEASE_NAME}" == "Arch Linux" ]] && __LINUX_PACKAGE_MANAGER="pacman"
[[ "${__LINUX_RELEASE_NAME}" == "Ubuntu" || "${__LINUX_RELEASE_NAME}" == "Debian GNU/Linux" || "${__LINUX_RELEASE_NAME}" == "Raspbian GNU/Linux" || "${__LINUX_RELEASE_NAME}" == "Android (Termux)" ]] && __LINUX_PACKAGE_MANAGER="apt"

if [[ "${__LINUX_PACKAGE_MANAGER}" == "pacman" ]]; then
  # =============================
  # pacman aliases (P*)
  alias pacman-list-all='sudo pacman -Q'
  alias pacman-list='sudo pacman -Qe' # explicitly installed
  alias pacman-update='sudo pacman -Sy --needed archlinux-keyring \
    && sudo pacman -Syu \
    && ( pacman -Qtdq && sudo pacman -Rns $(pacman -Qtdq) || echo "nothing to clear" )'
  alias pacman-remove='sudo pacman -R'
  alias pacman-install='sudo pacman -S --needed'

  alias PLA=pacman-list-all
  alias PL=pacman-list
  alias PU=pacman-update
  alias PR=pacman-remove
  alias PI=pacman-install

  # =============================
  __SYSTEM_PACKAGE_LIST_ALL='pacman-list-all'
  __SYSTEM_PACKAGE_LIST____='pacman-list'
  __SYSTEM_PACKAGE_UPDATE__='pacman-update'
  __SYSTEM_PACKAGE_REMOVE__='pacman-remove'
  __SYSTEM_PACKAGE_INSTALL_='pacman-install'
  __SYSTEM_REBOOT_REQUIRED_='node -p "const [ , newV, oldV, dot, msgY, msgN ] = process.argv; const nV = (v) => v.replace(/\\W/g, dot).toLowerCase(); nV(newV) === nV(oldV) ? msgN : msgY" \
    "$(pacman -Q linux | cut -d " " -f 2)" \
    "$(uname -r)" \
    "." \
    "Reboot Required" \
    "nope"' ## hacky node version for: https://bbs.archlinux.org/viewtopic.php?id=173508
fi

if [[ "${__LINUX_PACKAGE_MANAGER}" == "apt" ]]; then
  # =============================
  # apt aliases (A*)
  alias apt-list-all='sudo apt list --installed'
  alias apt-list='sudo apt-mark showmanual'
  alias apt-update='sudo apt update && sudo apt upgrade -y && sudo apt autoremove --purge -y'
  alias apt-remove='sudo apt autoremove --purge'
  alias apt-install='sudo apt install'

  alias ALA=apt-list-all
  alias AL=apt-list
  alias AU=apt-update
  alias AR=apt-remove
  alias AI=apt-install

  # =============================
  __SYSTEM_PACKAGE_LIST_ALL='apt-list-all'
  __SYSTEM_PACKAGE_LIST____='apt-list'
  __SYSTEM_PACKAGE_UPDATE__='apt-update'
  __SYSTEM_PACKAGE_REMOVE__='apt-remove'
  __SYSTEM_PACKAGE_INSTALL_='apt-install'
  __SYSTEM_REBOOT_REQUIRED_='[[ -f /var/run/reboot-required ]] && echo "Reboot Required" || echo "nope"'
fi

# =============================
# system aliases (S*)
[[ -n "${__SYSTEM_PACKAGE_LIST_ALL}" ]] && alias system-package-list-all="${__SYSTEM_PACKAGE_LIST_ALL}"
[[ -n "${__SYSTEM_PACKAGE_LIST____}" ]] && alias system-package-list="${__SYSTEM_PACKAGE_LIST____}"
[[ -n "${__SYSTEM_PACKAGE_UPDATE__}" ]] && alias system-package-update="${__SYSTEM_PACKAGE_UPDATE__}"
[[ -n "${__SYSTEM_PACKAGE_REMOVE__}" ]] && alias system-package-remove="${__SYSTEM_PACKAGE_REMOVE__}"
[[ -n "${__SYSTEM_PACKAGE_INSTALL_}" ]] && alias system-package-install="${__SYSTEM_PACKAGE_INSTALL_}"
[[ -n "${__SYSTEM_REBOOT_REQUIRED_}" ]] && alias system-reboot-required="${__SYSTEM_REBOOT_REQUIRED_}"

[[ -n "${__SYSTEM_PACKAGE_LIST_ALL}" ]] && alias SPLA=system-package-list-all
[[ -n "${__SYSTEM_PACKAGE_LIST____}" ]] && alias SPL=system-package-list
[[ -n "${__SYSTEM_PACKAGE_UPDATE__}" ]] && alias SPU=system-package-update
[[ -n "${__SYSTEM_PACKAGE_REMOVE__}" ]] && alias SPR=system-package-remove
[[ -n "${__SYSTEM_PACKAGE_INSTALL_}" ]] && alias SPI=system-package-install
[[ -n "${__SYSTEM_REBOOT_REQUIRED_}" ]] && alias SRR=system-reboot-required

if [[ "${__LINUX_RELEASE_NAME}" == "Android (Termux)" ]]; then
  # =============================
  # Already "sudo" for most of the command, do nothing, just patch the command for other script to work
  # Remove this if the Android is rooted and use the patched su/sudo instead
  alias sudo='SU=1'

  # =============================
  # TODO: NOTE: now seems it's not needed
  # env path fix, check "https://github.com/termux/termux-packages/issues/1192"
  alias proot-env='proot -b "$(which env):/usr/bin/env"'
  alias proot-env-link='proot -b "$(which env):/usr/bin/env" --link2symlink'
  alias PE=proot-env
  alias PEL=proot-env-link
fi
