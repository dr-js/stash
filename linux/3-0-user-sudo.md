# user and `sudo`

add a user named `USER_NAME` and uid/gid set to `USER_ID` with: (it's better to lock uid/gid early when later mount remote disk)
```shell script
USER_ID=17522 # node -p "('D'.charCodeAt() << 8) + 'r'.charCodeAt()"
USER_NAME="dr"
USER_FULL_NAME="Dr 0x4472"

# add group with same name & id
sudo groupadd \
  --gid "${USER_ID}" \
  "${USER_NAME}"
sudo useradd \
  --password "" $(: "The default is to disable the password.") \
  --expiredate "" $(: "The date on which the user account will be disabled. An empty string (no expiry) by default.") \
  --inactive -1 $(: "The number of days after a password expires until the account is permanently disabled. A value of -1 disables the feature.") \
  --shell "/bin/bash" $(: "The name of the user's login shell.") \
  --uid "${USER_ID}" $(: "The numerical value of the user's ID. This value must be unique.") \
  --gid "${USER_ID}" $(: "Join above group.") \
  --comment "${USER_FULL_NAME}" $(: "GECOS field of the new account") \
  --create-home $(: "Create the user's home directory if it does not exist.") \
  "${USER_NAME}" $(: "User login name, should be all lowercase.")

id "${USER_NAME}" # verify the uid/gid

sudo su "${USER_NAME}" # switch to the user USER_NAME
passwd # change the password of USER_NAME, or not add one and only setup SSH key to login
```

to delete a user's password (to prevent passwd login, but still allow SSH):
```shell script
USER_NAME="dr"

sudo passwd --delete "${USER_NAME}"
```

to allow user skip password for sudo: (check: https://askubuntu.com/questions/334318/sudoers-file-enable-nopasswd-for-user-all-commands)
```shell script
USER_NAME="dr"

# lazy way to allow sudo without password: https://stackoverflow.com/questions/323957/how-do-i-edit-etc-sudoers-from-a-script/28382838#28382838
echo "${USER_NAME} ALL=(ALL) NOPASSWD:ALL" | sudo EDITOR='tee -a' visudo

# or manually
sudo visudo # will open a temp sudoer list in editor, append at the end of the file
## USER_NAME    ALL=(ALL) NOPASSWD: ALL # For a single user
## %GROUP_NAME  ALL=(ALL) NOPASSWD: ALL # For a group
```

to delete existing user&group: (still keep user home directory)
```shell script
USER_NAME="dr"

sudo userdel "${USER_NAME}"
sudo groupdel "${USER_NAME}" # should been removed in last command
```

to change existing user&group: (need at least flush gid)
```shell script
USER_NAME="dr"
NEW_UID=17522

sudo usermod -u "${NEW_UID}" "${USER_NAME}" # will flush only the file uid in user home directory
sudo groupmod -g "${NEW_UID}" "${USER_NAME}"
```

to flush existing files: (check: https://askubuntu.com/questions/16700/how-can-i-change-my-own-user-id)
```shell script
# common change:
USER_NAME="dr"
NEW_UID=17522
OLD_UID=1000

sudo chown -Rhc --from="${OLD_UID}:${OLD_UID}" "${NEW_UID}:${NEW_UID}" "/home/${USER_NAME}" # change uid/gid, this may miss some uid/gid only files

# for some tougher situations:
sudo chown -Rhc --from="${OLD_UID}" "${NEW_UID}" "/home/${USER_NAME}" # change uid
sudo chown -Rhc --from=":${OLD_UID}" ":${NEW_UID}" "/home/${USER_NAME}" # change gid
```

to find possibly missed files:
```shell script
OLD_UID=1000

sudo find / -user "${OLD_UID}"
sudo find / -group "${OLD_UID}"
```
