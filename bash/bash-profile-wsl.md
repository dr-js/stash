# Bash profile WSL

add to `~/.proile` or `~/.bash_proile`

```shell script
# =============================
# sample usage:
#  - open a new WSL terminal only:
#      > exec-new-terminal
#      > ENT
#  - open a new WSL terminal, and run simple command:
#      > exec-new-terminal ls ..
#      > ENT ls ..
function exec-new-terminal {
  echo "PATH: [ $(pwd) ] ARGS: [ $@ ]"
  COMMAND="echo EXEC PATH: [ $(pwd) ] ARGS: [ $@ ];"
  COMMAND+="cd "$(pwd)";"
  if [[ $# -ne 0 ]]; then COMMAND+="$@;" ; fi
  COMMAND+="exec bash;"
  cmd.exe /c start bash -ilc "$COMMAND"
}
alias ENT=exec-new-terminal
```

```shell script
# =============================
# screen WSL fix, check "https://github.com/Microsoft/WSL/issues/1245"
export SCREEN_DIR="${HOME}/.screen"
test -d "${SCREEN_DIR}" || mkdir -p -m 700 "${SCREEN_DIR}"
```
