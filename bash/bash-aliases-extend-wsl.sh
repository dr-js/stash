# setup with:
#   (echo "" > ~/.bash_aliases_extend_wsl) && nano ~/.bash_aliases_extend_wsl # reset the file and open for edit
# then add to `~/.bashrc`: (default ubuntu `.bashrc` may be found at `/etc/skel/.bashrc`)
#   [[ -f ~/.bash_aliases_extend_wsl ]] && . ~/.bash_aliases_extend_wsl

# =============================
# mark version
alias bash-aliases-extend-wsl-version='echo 0.1.4'

alias BAEWV=bash-aliases-extend-wsl-version

# =============================
# TODO: NOTE: this will break for input with spaces
# sample usage:
#  - open a new WSL terminal only:
#      > exec-new-terminal
#      > ENT
#  - open a new WSL terminal, and run simple command:
#      > exec-new-terminal ls ..
#      > ENT ls ..
function exec-new-terminal {
  echo "PATH: [ $(pwd) ] ARGS: [ $* ]"
  COMMAND="echo EXEC PATH: [ $(pwd) ] ARGS: [ $* ];"
  COMMAND+="cd '$(pwd)';"
  if [[ $# -ne 0 ]]; then COMMAND+="$*;"; fi
  COMMAND+="exec bash;"
  cmd.exe /c start bash -ilc "$COMMAND"
}
alias ENT=exec-new-terminal

# =============================
# ONE-TIME FIX
# screen WSL fix, check "https://github.com/Microsoft/WSL/issues/1245"
#### export SCREEN_DIR="${HOME}/.screen"
#### test -d "${SCREEN_DIR}" || mkdir -p -m 700 "${SCREEN_DIR}"

# =============================
# ONE-TIME FIX
# fix wsl file permission always reset from win32 fs (too much 777)
# https://devblogs.microsoft.com/commandline/chmod-chown-wsl-improvements/
# https://www.turek.dev/post/fix-wsl-file-permissions/
# https://docs.microsoft.com/en-us/windows/wsl/wsl-config
#### sudo tee > /etc/wsl.conf <<- 'EOM'
#### [automount]
#### enabled = true
#### root = /mnt/
#### options = "metadata,umask=22,fmask=11"
#### mountFsTab = false
#### EOM
