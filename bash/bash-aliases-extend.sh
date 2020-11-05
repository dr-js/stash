# setup with: (or use below alias command `bash-aliases-extend-update`)
#   (echo "" > ~/.bash_aliases_extend) && nano ~/.bash_aliases_extend # reset the file and open for edit
# then add to `~/.bashrc`
#   [[ -f ~/.bash_aliases_extend ]] && . ~/.bash_aliases_extend

# =============================
# mark version
alias bash-aliases-extend-version='echo 0.3.15'
alias bash-aliases-extend-update='dr-js -f "https://raw.githubusercontent.com/dr-js/stash/master/bash/bash-aliases-extend.sh" -O ~/.bash_aliases_extend'

alias BAEV=bash-aliases-extend-version
alias BAEU=bash-aliases-extend-update

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
alias cbbbbb='cd ../../../../../'
function ccd { mkdir -p "$1"; cd "$1"; } # $1=path to create and cd to

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
alias git-branch-list='git branch --all --list' # local and remote
alias git-branch-delete='git branch -D'
alias git-checkout-branch-remote='git checkout --track' # $1=remove-branch-name # create and switch to a local branch tracking the remote
function git-cherry-pack-range { git cherry-pick "$1"^.."$2"; } # $1=commit-from, $2=commit-to # will include both from/to commit
alias git-cherry-pack-abort='git cherry-pick --abort'
alias git-cherry-pack-continue='git cherry-pick --continue'
alias git-clear='git remote prune origin && git gc --prune=now'
alias git-commit='git commit'
alias git-commit-amend='git commit --amend'
alias git-clone='git clone'
alias git-clone-minimal='git clone --depth 1 --no-tags --config remote.origin.fetch=+refs/heads/master:refs/remotes/origin/master'
function git-tag-combo { git tag --force "$1"; git push origin "$1"; }
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
# alias git-trace='GIT_TRACE=1'

alias G=git-fetch
alias GG=git-git-combo
alias GGG=git-git-git-combo
alias GGGG=git-git-git-git-combo
alias GS=git-status
alias GP=git-push
alias GRH=git-reset-hard
alias GGRH=git-git-reset-head
alias GBL=git-branch-list
alias GBD=git-branch-delete
alias GCBR=git-checkout-branch-remote
alias GCPR=git-cherry-pack-range
alias GCPA=git-cherry-pack-abort
alias GCPC=git-cherry-pack-continue
alias GC=git-clear
alias GCM=git-commit
alias GCMA=git-commit-amend
alias GCLO=git-clone
alias GCLOM=git-clone-minimal
alias GTC=git-tag-combo
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
# alias GT=git-trace

# =============================
# systemd aliases (SD*,SR*)
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

alias systemd-resolve-flush-caches='systemd-resolve --flush-caches'
alias systemd-resolve-statistics='systemd-resolve --statistics'
alias systemd-resolvectl-status='resolvectl status'

alias SRFC=systemd-resolve-flush-caches
alias SRS=systemd-resolve-statistics
alias SRCS=systemd-resolvectl-status

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
# docker aliases (DC*,DI*)

alias docker-container-run='sudo docker container run'
function docker-container-run-bash { sudo docker container run --interactive --tty "$1" "/bin/bash"; } # $1=container name or id
alias docker-container-exec='sudo docker container exec'
function docker-container-exec-bash { sudo docker container exec --interactive --tty "$1" "/bin/bash"; } # $1=container name or id
alias docker-container-attach='sudo docker container attach'
alias docker-container-ls='sudo docker container ls'
alias docker-container-ls-all='sudo docker container ls --all'
alias docker-container-rm='sudo docker container rm'
alias docker-container-prune='sudo docker container prune'
alias docker-container-kill='sudo docker container kill'
alias docker-container-stop='sudo docker container stop'
alias docker-container-stats='sudo docker container stats --no-stream --no-trunc'
alias docker-container-inspect='sudo docker container inspect'

alias DCR=docker-container-run
alias DCRB=docker-container-run-bash
alias DCE=docker-container-exec
alias DCEB=docker-container-exec-bash
alias DCA=docker-container-attach
alias DCLS=docker-container-ls
alias DCLA=docker-container-ls-all
alias DCRM=docker-container-rm
alias DCP=docker-container-prune
alias DCKILL=docker-container-kill
alias DCSTOP=docker-container-stop
alias DCS=docker-container-stats
alias DCI=docker-container-inspect

alias docker-image-build='sudo docker image build'
alias docker-image-push='sudo docker image push'
alias docker-image-pull='sudo docker image pull'
alias docker-image-save='sudo docker image save'
alias docker-image-load='sudo docker image import' # TODO: why the non-paired naming?
alias docker-image-import='sudo docker image import'
alias docker-image-ls='sudo docker image ls'
alias docker-image-ls-all='sudo docker image ls --all'
alias docker-image-rm='sudo docker image rm'
alias docker-image-prune='sudo docker image prune'
alias docker-image-history='sudo docker image history'
alias docker-image-inspect='sudo docker image inspect'

alias DIB=docker-image-build
alias DIPUSH=docker-image-push
alias DIPULL=docker-image-pull
alias DISAVE=docker-image-save
alias DILOAD=docker-image-load
alias DIIMPORT=docker-image-import
alias DILS=docker-image-ls
alias DILA=docker-image-ls-all
alias DIRM=docker-image-rm
alias DIP=docker-image-prune
alias DIH=docker-image-history
alias DII=docker-image-inspect

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
alias quick-du='du -hd1'
alias quick-ssh-key-md5-list='ssh-keygen -E md5 -lf ~/.ssh/authorized_keys'
alias quick-list-listen-socket='ss -tulnp' # command from `iproute2`
if [[ -d /sys/class/thermal/thermal_zone0 ]]; then
  __QUICK_SYSTEM_WATCH='watch --no-title "echo == cpufreq ==; cat /sys/devices/system/cpu/cpufreq/policy*/scaling_cur_freq; echo == thermal ==; cat /sys/class/thermal/thermal_zone*/temp;"'
else # if grep -q "cpu MHz" /proc/cpuinfo; then
  __QUICK_SYSTEM_WATCH='watch --no-title grep \"cpu MHz\" /proc/cpuinfo'
fi
alias quick-system-watch="${__QUICK_SYSTEM_WATCH}"
function quick-run-background { "$@" &>/dev/null & }

alias QDDR=quick-dd-random
alias QSHUTDOWN=quick-shutdown
alias QREBOOT=quick-reboot
alias QDF=quick-df
alias QDU=quick-du
alias QSKML=quick-ssh-key-md5-list
alias QLLS=quick-list-listen-socket
alias QSW=quick-system-watch
alias QRBG=quick-run-background

# =============================
# @dr-js aliases (D*)
alias dr-js-npm-install-global-all='sudo npm i -g @dr-js/core @dr-js/node @dr-js/dev'
alias dr-js-npm-install-global-all-dev='sudo npm i -g @dr-js/core@dev @dr-js/node@dev @dr-js/dev@dev'
alias dr-js-rm='dr-js --rm'
alias dr-js-package-reset='dr-js-rm package-lock.json node_modules'
alias dr-js-package-reset-combo='dr-js-package-reset && npm-install'

alias DNIGA=dr-js-npm-install-global-all
alias DNIGAD=dr-js-npm-install-global-all-dev
alias DRM=dr-js-rm
alias DPR=dr-js-package-reset
alias DPRC=dr-js-package-reset-combo

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
alias cd-shadowsocks='cd /etc/shadowsocks-libev/' # pacman should create soft link /etc/shadowsocks-libev/ to  /etc/shadowsocks/

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

__LINUX_CPU_ARCHITECTURE="$(uname --machine)" # mostly `x86_64`, and `aarch64` or `armv7l` for android/rpi4 check: https://en.wikipedia.org/wiki/Uname#Examples

__LINUX_PACKAGE_MANAGER="unknown"
[[ "${__LINUX_RELEASE_NAME}" == "Arch Linux" || "${__LINUX_RELEASE_NAME}" == "Arch Linux ARM" ]] && __LINUX_PACKAGE_MANAGER="pacman"
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
  function pacman-provide-bin { sudo pacman -F "$(command -v "$1")"; } # $1=bin-name-or-full-path # https://unix.stackexchange.com/questions/14858/in-arch-linux-how-can-i-find-out-which-package-to-install-that-will-contain-file

  alias PLA=pacman-list-all
  alias PL=pacman-list
  alias PU=pacman-update
  alias PR=pacman-remove
  alias PI=pacman-install
  alias PPB=pacman-provide-bin

  # =============================
  __SYSTEM_PACKAGE_LIST_ALL___='pacman-list-all'
  __SYSTEM_PACKAGE_LIST_______='pacman-list'
  __SYSTEM_PACKAGE_UPDATE_____='pacman-update'
  __SYSTEM_PACKAGE_REMOVE_____='pacman-remove'
  __SYSTEM_PACKAGE_INSTALL____='pacman-install'
  __SYSTEM_PACKAGE_PROVIDE_BIN='pacman-provide-bin'
  ## hacky node version for: https://bbs.archlinux.org/viewtopic.php?id=173508
  ## NOTE: for ArchLinuxARM `uname -r` will print extra `-ARCH`
  __SYSTEM_REBOOT_REQUIRED____='node -p "const [ , newV, oldV, dot, msgY, msgN ] = process.argv; const nV = (v) => v.replace(/\\W/g, dot).toLowerCase(); nV(oldV).startsWith(nV(newV)) ? msgN : msgY" \
    "$(pacman -Q linux | cut -d " " -f 2)" \
    "$(uname -r)" \
    "." \
    "Reboot Required" \
    "nope"'
fi

if [[ "${__LINUX_PACKAGE_MANAGER}" == "apt" ]]; then
  # =============================
  # apt aliases (A*)
  alias apt-list-all='sudo apt list --installed'
  alias apt-list='sudo apt-mark showmanual'
  alias apt-update='sudo apt update && sudo apt upgrade -y && sudo apt autoremove --purge -y'
  alias apt-remove='sudo apt autoremove --purge'
  alias apt-install='sudo apt install'
  function apt-provide-bin { sudo dpkg -S "$(command -v "$1")"; } # $1=bin-name-or-full-path # https://serverfault.com/questions/30737/how-do-i-find-the-package-that-contains-a-given-program-on-ubuntu

  alias ALA=apt-list-all
  alias AL=apt-list
  alias AU=apt-update
  alias AR=apt-remove
  alias AI=apt-install
  alias APB=apt-provide-bin

  # =============================
  __SYSTEM_PACKAGE_LIST_ALL___='apt-list-all'
  __SYSTEM_PACKAGE_LIST_______='apt-list'
  __SYSTEM_PACKAGE_UPDATE_____='apt-update'
  __SYSTEM_PACKAGE_REMOVE_____='apt-remove'
  __SYSTEM_PACKAGE_INSTALL____='apt-install'
  __SYSTEM_PACKAGE_PROVIDE_BIN='apt-provide-bin'
  __SYSTEM_REBOOT_REQUIRED____='[[ -f /var/run/reboot-required ]] && echo "Reboot Required" || echo "nope"'
fi

# =============================
# system aliases (S*)
[[ -n "${__SYSTEM_PACKAGE_LIST_ALL___}" ]] && alias system-package-list-all="${__SYSTEM_PACKAGE_LIST_ALL___}"
[[ -n "${__SYSTEM_PACKAGE_LIST_______}" ]] && alias system-package-list="${__SYSTEM_PACKAGE_LIST_______}"
[[ -n "${__SYSTEM_PACKAGE_UPDATE_____}" ]] && alias system-package-update="${__SYSTEM_PACKAGE_UPDATE_____}"
[[ -n "${__SYSTEM_PACKAGE_REMOVE_____}" ]] && alias system-package-remove="${__SYSTEM_PACKAGE_REMOVE_____}"
[[ -n "${__SYSTEM_PACKAGE_INSTALL____}" ]] && alias system-package-install="${__SYSTEM_PACKAGE_INSTALL____}"
[[ -n "${__SYSTEM_PACKAGE_PROVIDE_BIN}" ]] && alias system-package-provide-bin="${__SYSTEM_PACKAGE_PROVIDE_BIN}"
[[ -n "${__SYSTEM_REBOOT_REQUIRED____}" ]] && alias system-reboot-required="${__SYSTEM_REBOOT_REQUIRED____}"

[[ -n "${__SYSTEM_PACKAGE_LIST_ALL___}" ]] && alias SPLA=system-package-list-all
[[ -n "${__SYSTEM_PACKAGE_LIST_______}" ]] && alias SPL=system-package-list
[[ -n "${__SYSTEM_PACKAGE_UPDATE_____}" ]] && alias SPU=system-package-update
[[ -n "${__SYSTEM_PACKAGE_REMOVE_____}" ]] && alias SPR=system-package-remove
[[ -n "${__SYSTEM_PACKAGE_INSTALL____}" ]] && alias SPI=system-package-install
[[ -n "${__SYSTEM_PACKAGE_PROVIDE_BIN}" ]] && alias SPPB=system-package-provide-bin
[[ -n "${__SYSTEM_REBOOT_REQUIRED____}" ]] && alias SRR=system-reboot-required

if [[ "${__LINUX_RELEASE_NAME}" == "Android (Termux)" ]]; then
  # =============================
  # Already "sudo" for most of the command, do nothing, just patch the command for other script to work
  # Remove this if the Android is rooted and use the patched su/sudo instead
  alias sudo='SU=1'

  # =============================
  # TODO: NOTE: now seems it's not needed
  # env path fix, check "https://github.com/termux/termux-packages/issues/1192"
  alias proot-env='proot -b "$(command -v env):/usr/bin/env"'
  alias proot-env-link='proot -b "$(command -v env):/usr/bin/env" --link2symlink'
  alias PE=proot-env
  alias PEL=proot-env-link
fi

# =============================
# export to sub process env (test with `env` or `node -p process.env`)
export __LINUX_RELEASE_NAME
export __LINUX_CPU_ARCHITECTURE
export __LINUX_PACKAGE_MANAGER
