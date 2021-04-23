# env


to change system wide env variable, add:
```shell script
sudo tee -a /etc/environment <<- EOM
# set default editor
VISUAL=nano
EDITOR=nano
EOM
```
