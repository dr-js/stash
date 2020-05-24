# sudo


to allow user skip password for sudo: (check: https://askubuntu.com/questions/334318/sudoers-file-enable-nopasswd-for-user-all-commands)
```shell script
sudo visudo # will open a temp sudoer list in editor, append at the end of the file
## USER_NAME    ALL=(ALL) NOPASSWD: ALL # For a single user
## %GROUP_NAME  ALL=(ALL) NOPASSWD: ALL # For a group
```
