# setup with: (or use below alias command `bash-aliases-extend-update`)
#   (echo "" > ~/.bash_aliases_extend) && nano ~/.bash_aliases_extend # reset the file and open for edit
# then add to `~/.bashrc`
#   [[ -f ~/.bash_aliases_extend ]] && . ~/.bash_aliases_extend

# =============================
# mark version
alias bash-aliases-extend-version='echo 0.3.30'
alias bash-aliases-extend-update='dr-dev -f "https://raw.githubusercontent.com/dr-js/stash/master/bash/bash-aliases-extend.sh" -O ~/.bash_aliases_extend && source ~/.bash_aliases_extend'

alias BAEV=bash-aliases-extend-version
alias BAEU=bash-aliases-extend-update

# =============================
# ls aliases (l*)
alias llh='ls -ahlF'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# =============================
# screen clear aliases, should be supported in xterm/VT100 # https://apple.stackexchange.com/questions/31872/how-do-i-reset-the-scrollback-in-the-terminal-via-a-shell-command/318217#318217
alias CLS='printf "\e[2J\e[3J\e[H"'
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
alias git-fetch-all='git fetch --all --tags'
alias git-git-combo='git fetch --prune' # no `--prune-tags`
alias git-git-git-combo='git fetch --prune && git gc --auto'
alias git-git-git-git-combo='git fetch --prune && git gc --prune=now'
alias git-status='git status'
alias git-push='git push'
alias git-push-force='git push --force'
alias git-reset-hard='git reset --hard @{upstream}'
alias git-git-reset-head='git-git-combo && git-reset-hard'
alias git-branch-list='git branch --list' # local
alias git-branch-list-all='git branch --list --all' # local and remote
alias git-branch-delete='git branch --delete --force'
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
alias git-tag-clear-local='git tag --delete $(git tag -l)'
alias git-tag-push-origin='git push origin' # append the tag name
alias git-tag-push-force-origin='git push --force origin' # append the tag name
alias git-tag-delete-origin='git push --delete origin' # append the tag name (or full name like `refs/tags/v0.4.2`)
alias git-ls-files-stage='git ls-files --stage'
alias git-update-644='git update-index --chmod=-x'
alias git-update-755='git update-index --chmod=+x'
alias git-log='git log'
alias git-log-16='git-log -16'
alias git-log-oneline='git log --date=short --pretty=format:"%C(auto,yellow)%h %C(auto,blue)%>(12,trunc)%ad %C(auto,green)%<(7,trunc)%aN%C(auto,reset)%s%C(auto,red)% gD% D"'
alias git-log-oneline-16='git-log-oneline -16'
alias git-log-brief='git log --pretty=format:"- %s"'
alias git-log-brief-16='git-log-brief -16'
alias git-log-graph='git log --graph --oneline'
alias git-log-graph-16='git-log-graph -16'
# alias git-trace='GIT_TRACE=1'

alias GF=git-fetch
alias GFA=git-fetch-all
alias GG=git-git-combo
alias GGG=git-git-git-combo
alias GGGG=git-git-git-git-combo
alias GS=git-status
alias GP=git-push
alias GPF=git-push-force
alias GRH=git-reset-hard
alias GGRH=git-git-reset-head
alias GBL=git-branch-list
alias GBLA=git-branch-list-all
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
alias GTPO=git-tag-push-origin
alias GTPFO=git-tag-push-force-origin
alias GTDO=git-tag-delete-origin
alias GLS=git-ls-files-stage
alias G644=git-update-644
alias G755=git-update-755
alias GL=git-log
alias GL16=git-log-16
alias GLO=git-log-oneline
alias GLO16=git-log-oneline-16
alias GLB=git-log-brief
alias GLB16=git-log-brief-16
alias GLG=git-log-graph
alias GLG16=git-log-graph-16
# alias GT=git-trace

# =============================
# systemd aliases (SD*,SR*)
alias systemd-list-active='sudo systemctl list-units --type=service --state=active'
alias systemd-list-enabled='sudo systemctl list-unit-files --type=service --state=enabled,generated'
alias systemd-list-timers='sudo systemctl list-timers'
alias systemd-daemon-reload='sudo systemctl daemon-reload'
alias systemd-reset-failed='sudo systemctl reset-failed' # https://serverfault.com/questions/606520/how-to-remove-missing-systemd-units
alias systemd-start='sudo systemctl start'
alias systemd-stop='sudo systemctl stop'
alias systemd-status='sudo systemctl status'
alias systemd-enable='sudo systemctl enable'
alias systemd-disable='sudo systemctl disable'
alias systemd-restart='sudo systemctl restart'
alias systemd-reload='sudo systemctl reload'

alias SDLA=systemd-list-active
alias SDLE=systemd-list-enabled
alias SDLT=systemd-list-timers
alias SDDR=systemd-daemon-reload
alias SDRF=systemd-reset-failed
alias SDON=systemd-start
alias SDOFF=systemd-stop
alias SDS=systemd-status
alias SDE=systemd-enable
alias SDD=systemd-disable
alias SDRS=systemd-restart
alias SDRL=systemd-reload

alias systemd-resolve-flush-caches='sudo systemd-resolve --flush-caches'
alias systemd-resolve-statistics='sudo systemd-resolve --statistics'
alias systemd-resolvectl-status='sudo resolvectl status'
alias systemd-journalctl-vacuum='sudo journalctl --flush --rotate && sudo journalctl --vacuum-size=0.5G'

alias SRFC=systemd-resolve-flush-caches
alias SRS=systemd-resolve-statistics
alias SRCS=systemd-resolvectl-status
alias SJV=systemd-journalctl-vacuum

# =============================
# npm aliases (N*)
alias npm-list-global='npm ls --global --depth=0'
alias npm-install='npm install'
alias npm-install-global='sudo npm install --global'
alias npm-install-prefer-offline='npm install --prefer-offline'
alias npm-install-package-lock-only='npm install --package-lock-only'
alias npm-outdated='npm outdated'
alias npm-dedup-install='npm ddp && npm install --prefer-offline'
alias npm-audit='npm audit'
alias npm-audit-fix='npm audit fix'
alias npm-run='npm run'

alias NLSG=npm-list-global
alias NI=npm-install
alias NIG=npm-install-global
alias NIO=npm-install-prefer-offline
alias NIPLO=npm-install-package-lock-only
alias NO=npm-outdated
alias NDI=npm-dedup-install
alias NA=npm-audit
alias NAF=npm-audit-fix
alias NR=npm-run

# =============================
# npm8 aliases (n*) (from `@min-pack/npm`)
alias npm8-install='npm8 install'
alias NNI=npm8-install

# =============================
# docker aliases (DC*,DI*,DV*)

alias docker-container-run='sudo docker container run'
alias docker-container-run-bash='sudo docker container run --interactive --tty --rm --entrypoint "/bin/bash"'
alias docker-container-exec='sudo docker container exec'
function docker-container-exec-bash { sudo docker container exec --interactive --tty "$1" "/bin/bash"; } # $1=container name or id
alias docker-container-attach='sudo docker container attach'
alias docker-container-ls='sudo docker container ls'
alias docker-container-ls-all='sudo docker container ls --all'
alias docker-container-ls-minimal='sudo docker container ls --format="table {{.ID}}\t{{.Names}}\t{{.Status}}\t{{.Image}}"'
alias docker-container-logs='sudo docker container logs'
alias docker-container-logs-tail='sudo docker container logs --follow --tail=10'
alias docker-container-top='sudo docker container top'
alias docker-container-rm='sudo docker container rm'
alias docker-container-prune='sudo docker container prune'
alias docker-container-prune-force='sudo docker container prune --force'
alias docker-container-kill='sudo docker container kill'
alias docker-container-stop='sudo docker container stop'
alias docker-container-stats='sudo docker container stats --no-stream --no-trunc'
alias docker-container-inspect='sudo docker container inspect'
alias docker-container-commit='sudo docker container commit'

alias DCR=docker-container-run
alias DCRB=docker-container-run-bash
alias DCE=docker-container-exec
alias DCEB=docker-container-exec-bash
alias DCA=docker-container-attach
alias DCLS=docker-container-ls
alias DCLA=docker-container-ls-all
alias DCLM=docker-container-ls-minimal
alias DCLOG=docker-container-logs
alias DCLOGT=docker-container-logs-tail
alias DCTOP=docker-container-top
alias DCRM=docker-container-rm
alias DCP=docker-container-prune
alias DCPF=docker-container-prune-force
alias DCKILL=docker-container-kill
alias DCSTOP=docker-container-stop
alias DCS=docker-container-stats
alias DCI=docker-container-inspect
alias DCC=docker-container-commit

alias docker-image-build='sudo docker image build'
alias docker-image-push='sudo docker image push'
alias docker-image-pull='sudo docker image pull'
alias docker-image-load='sudo docker image load'
alias docker-image-save='sudo docker image save'
alias docker-image-ls='sudo docker image ls'
alias docker-image-ls-all='sudo docker image ls --all'
alias docker-image-ls-tag='sudo docker image ls --format="{{.Repository}}:{{.Tag}}"'
alias docker-image-rm='sudo docker image rm'
alias docker-image-prune='sudo docker image prune'
alias docker-image-prune-force='sudo docker image prune --force'
alias docker-image-history='sudo docker image history'
alias docker-image-inspect='sudo docker image inspect'

alias DIB=docker-image-build
alias DIPUSH=docker-image-push
alias DIPULL=docker-image-pull
alias DILOAD=docker-image-load
alias DISAVE=docker-image-save
alias DILS=docker-image-ls
alias DILA=docker-image-ls-all
alias DILT=docker-image-ls-tag
alias DIRM=docker-image-rm
alias DIP=docker-image-prune
alias DIPF=docker-image-prune-force
alias DIH=docker-image-history
alias DII=docker-image-inspect

alias docker-volume-ls='sudo docker volume ls'
alias docker-volume-rm='sudo docker volume rm'
alias docker-volume-create='sudo docker volume create'
alias docker-volume-inspect='sudo docker volume inspect'

alias DVLS=docker-volume-ls
alias DVRM=docker-volume-rm
alias DVC=docker-volume-create
alias DVI=docker-volume-inspect

# =============================
# screen aliases (S*)
alias screen-resume='screen -R'
alias screen-list='screen -ls'

alias SR=screen-resume
alias SL=screen-list

# =============================
# quick aliases (Q*)
function quick-dd-random { dd bs=1048576 count="${1:-100}" if=/dev/urandom of="./RANDOM-${1:-100}MiB"; } # $1=size-in-MiB-default-to-100
alias quick-shutdown='sudo shutdown 0'
alias quick-reboot='sudo reboot'
alias quick-df='df -h'
alias quick-df-current='df -h .'
alias quick-du='du -hd1'
alias quick-ssh-key-md5-list='ssh-keygen -E md5 -lf ~/.ssh/authorized_keys'
function quick-ssh-keygen { # $1=KEY_NAME, $2=HOST_HOSTNAME
  KEY_NAME="${1:-"KEY_$(TZ=UTC0 date +%Y%m%d)_4096"}"
  HOST_HOSTNAME="${2:-"$(node -p "os.hostname() || 'unknown-host'")"}"
  sudo ssh-keygen -t rsa -b 4096 -N "" \
  -f "./${KEY_NAME}.pri" \
  -C "${KEY_NAME}@${HOST_HOSTNAME}"
  sudo mv "./${KEY_NAME}.pri.pub" "./${KEY_NAME}.pub" # fix naming
}
alias quick-list-listen-socket='sudo ss -tulnp' # command from `iproute2`, use `sudo` to get full pid info
if [[ -d /sys/class/thermal/thermal_zone0 ]]; then
  __QUICK_SYSTEM_WATCH='watch --no-title "echo == cpufreq ==; cat /sys/devices/system/cpu/cpufreq/policy*/scaling_cur_freq; echo == thermal ==; cat /sys/class/thermal/thermal_zone*/temp;"'
else # if grep -q "cpu MHz" /proc/cpuinfo; then
  __QUICK_SYSTEM_WATCH='watch --no-title grep \"cpu MHz\" /proc/cpuinfo'
fi
alias quick-system-watch="${__QUICK_SYSTEM_WATCH}"
function quick-run-background { "$@" &>/dev/null & }
alias quick-drop-caches='sync; sudo bash -c "echo 1 > /proc/sys/vm/drop_caches"'
alias quick-sudo-bash='sudo bash'
alias quick-git-diff='git diff --no-index --' # $1=old $2=new
function quick-git-tag-push { TAG="$(node -p "'v'+require('./package.json').version")" && git tag "$TAG" && git push origin "$TAG"; }
function quick-git-tag-push-force { TAG="$(node -p "'v'+require('./package.json').version")" && git tag --force "$TAG" && git push origin --force "$TAG"; }
alias quick-git-push-combo='git-push && quick-git-tag-push'
alias quick-git-push-combo-force='git-push-force && quick-git-tag-push-force'
function quick-nano-reset { echo "" > "$1"; nano "$1"; } # $1=file-to-reset-and-edit

alias QDDR=quick-dd-random
alias QSHUTDOWN=quick-shutdown
alias QREBOOT=quick-reboot
alias QDF=quick-df
alias QDFC=quick-df-current
alias QDU=quick-du
alias QSKML=quick-ssh-key-md5-list
alias QSKG=quick-ssh-keygen
alias QLLS=quick-list-listen-socket
alias QSW=quick-system-watch
alias QRBG=quick-run-background
alias QDC=quick-drop-caches
alias QSB=quick-sudo-bash
alias QGD=quick-git-diff
alias QGTP=quick-git-tag-push
alias QGTPF=quick-git-tag-push-force
alias QGPC=quick-git-push-combo
alias QGPCF=quick-git-push-combo-force
alias QNR=quick-nano-reset

# =============================
# @dr-js aliases (D*)
alias dr-js-npm-install-global-all='sudo npm i -g @dr-js/core @dr-js/dev'
alias dr-js-npm-install-global-all-dev='sudo npm i -g @dr-js/core@dev @dr-js/dev@dev'
alias dr-js-rm='dr-js --rm'
alias dr-js-package-reset='dr-js-rm package-lock.json node_modules'
alias dr-js-package-reset-combo='dr-js-package-reset && npm-install'
alias dr-js-package-reset-combo-combo='dr-js-package-reset && npm-install-prefer-offline'

alias DNIGA=dr-js-npm-install-global-all
alias DNIGAD=dr-js-npm-install-global-all-dev
alias DRM=dr-js-rm
alias DPR=dr-js-package-reset
alias DPRC=dr-js-package-reset-combo
alias DPRCC=dr-js-package-reset-combo-combo

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
__IS_WSL2="$([[ -d "/run/WSL" ]] && echo "1" || echo "")" # https://github.com/microsoft/WSL/issues/4555#issuecomment-647561393
__PROXY_HTTP_PORT="$([[ "$__IS_WSL2" == "1" ]] && echo "21080" || echo "1080")" # use 21080 for WSL2 `privoxy`
__PROXY_SOCKS5_PORT="$([[ "$__IS_WSL2" == "1" ]] && echo "21081" || node -e "process.exitCode = Number(os.platform() !== 'win32')" && echo "1080" || echo "1081")" # use 210801 for WSL2 `ss-local`, win10 SS support socks5+http in single port, but not on other platform
__PROXY_HTTP="http://127.0.0.1:${__PROXY_HTTP_PORT}"
__PROXY_HTTPS="http://127.0.0.1:${__PROXY_HTTP_PORT}" # most proxy support both
__PROXY_SOCKS5="socks5://127.0.0.1:${__PROXY_SOCKS5_PORT}"

alias proxy-on='export \
  http_proxy="${__PROXY_HTTP}" \
  https_proxy="${__PROXY_HTTPS}" \
  HTTP_PROXY="${__PROXY_HTTP}" \
  HTTPS_PROXY="${__PROXY_HTTPS}" \
'
alias proxy-off='unset \
  http_proxy \
  https_proxy \
  HTTP_PROXY \
  HTTPS_PROXY \
'
alias proxy-once=' \
  http_proxy="${__PROXY_HTTP}" \
  https_proxy="${__PROXY_HTTPS}" \
  HTTP_PROXY="${__PROXY_HTTP}" \
  HTTPS_PROXY="${__PROXY_HTTPS}" \
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
[[ "${__LINUX_RELEASE_NAME}" == "Arch Linux" || "${__LINUX_RELEASE_NAME}" == "Arch Linux ARM" || "${__LINUX_RELEASE_NAME}" == "Manjaro Linux" || "${__LINUX_RELEASE_NAME}" == "Manjaro-ARM" ]] && __LINUX_PACKAGE_MANAGER="pacman"
[[ "${__LINUX_RELEASE_NAME}" == "Ubuntu" || "${__LINUX_RELEASE_NAME}" == "Debian GNU/Linux" || "${__LINUX_RELEASE_NAME}" == "Raspbian GNU/Linux" || "${__LINUX_RELEASE_NAME}" == "Android (Termux)" ]] && __LINUX_PACKAGE_MANAGER="apt"

if [[ "${__LINUX_PACKAGE_MANAGER}" == "pacman" ]]; then
  # =============================
  # pacman aliases (P*)
  alias pacman-list-all='sudo pacman -Q'
  alias pacman-list='sudo pacman -Qe' # explicitly installed
  alias pacman-update='sudo pacman -Sy --needed archlinux-keyring \
    && sudo pacman -Syu \
    && ( pacman -Qtdq && sudo pacman -Rns $(pacman -Qtdq) || echo "nothing to clear" && sudo pacman -Sc --noconfirm )'
  alias pacman-remove='sudo pacman -R'
  alias pacman-install='sudo pacman -S --needed'
  function pacman-provide-bin { sudo pacman -F "$(command -v "$1")"; } # $1=bin-name-or-full-path # https://unix.stackexchange.com/questions/14858/in-arch-linux-how-can-i-find-out-which-package-to-install-that-will-contain-file
  alias pacman-why='sudo pacman -Qi' # check the `Required By` row

  alias PLA=pacman-list-all
  alias PL=pacman-list
  alias PU=pacman-update
  alias PR=pacman-remove
  alias PI=pacman-install
  alias PPB=pacman-provide-bin
  alias PWHY=pacman-why

  # =============================
  __SYSTEM_PACKAGE_LIST_ALL___='pacman-list-all'
  __SYSTEM_PACKAGE_LIST_______='pacman-list'
  __SYSTEM_PACKAGE_UPDATE_____='pacman-update'
  __SYSTEM_PACKAGE_REMOVE_____='pacman-remove'
  __SYSTEM_PACKAGE_INSTALL____='pacman-install'
  __SYSTEM_PACKAGE_PROVIDE_BIN='pacman-provide-bin'
  __SYSTEM_PACKAGE_WHY________='pacman-why'
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
  alias apt-why='sudo apt-cache rdepends --no-suggests --no-conflicts --no-breaks --no-replaces --no-enhances --installed --recurse' # https://askubuntu.com/questions/5636/can-i-see-why-a-package-is-installed#comment505140_5637

  alias ALA=apt-list-all
  alias AL=apt-list
  alias AU=apt-update
  alias AR=apt-remove
  alias AI=apt-install
  alias APB=apt-provide-bin
  alias AWHY=apt-why

  # =============================
  __SYSTEM_PACKAGE_LIST_ALL___='apt-list-all'
  __SYSTEM_PACKAGE_LIST_______='apt-list'
  __SYSTEM_PACKAGE_UPDATE_____='apt-update'
  __SYSTEM_PACKAGE_REMOVE_____='apt-remove'
  __SYSTEM_PACKAGE_INSTALL____='apt-install'
  __SYSTEM_PACKAGE_PROVIDE_BIN='apt-provide-bin'
  __SYSTEM_PACKAGE_WHY________='apt-why'
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
[[ -n "${__SYSTEM_PACKAGE_WHY________}" ]] && alias system-package-why="${__SYSTEM_PACKAGE_WHY________}"
[[ -n "${__SYSTEM_REBOOT_REQUIRED____}" ]] && alias system-reboot-required="${__SYSTEM_REBOOT_REQUIRED____}"

[[ -n "${__SYSTEM_PACKAGE_LIST_ALL___}" ]] && alias SPLA=system-package-list-all
[[ -n "${__SYSTEM_PACKAGE_LIST_______}" ]] && alias SPL=system-package-list
[[ -n "${__SYSTEM_PACKAGE_UPDATE_____}" ]] && alias SPU=system-package-update
[[ -n "${__SYSTEM_PACKAGE_REMOVE_____}" ]] && alias SPR=system-package-remove
[[ -n "${__SYSTEM_PACKAGE_INSTALL____}" ]] && alias SPI=system-package-install
[[ -n "${__SYSTEM_PACKAGE_PROVIDE_BIN}" ]] && alias SPPB=system-package-provide-bin
[[ -n "${__SYSTEM_PACKAGE_WHY________}" ]] && alias SPW=system-package-why
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
export __IS_WSL2
export __PROXY_HTTP
export __PROXY_HTTPS
export __PROXY_SOCKS5
export __LINUX_RELEASE_NAME
export __LINUX_CPU_ARCHITECTURE
export __LINUX_PACKAGE_MANAGER
