# user and `sudo`

add a user named `USER_NAME` with:
```shell script
sudo useradd --create-home USER_NAME
sudo su USER_NAME # switch to the user USER_NAME
passwd # change the password of USER_NAME or not add one and only setup SSH key to login
```

to delete a user's password (to prevent passwd login):
```shell script
sudo passwd --delete USER_NAME
```

to allow user skip password for sudo: (check: https://askubuntu.com/questions/334318/sudoers-file-enable-nopasswd-for-user-all-commands)
```shell script
sudo visudo # will open a temp sudoer list in editor, append at the end of the file
## USER_NAME    ALL=(ALL) NOPASSWD: ALL # For a single user
## %GROUP_NAME  ALL=(ALL) NOPASSWD: ALL # For a group
```
