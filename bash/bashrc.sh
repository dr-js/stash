# ~/.bashrc: executed by bash(1) for non-login shells.
# edited from ubuntu1804 `/etc/skel/.bashrc`

# If not running interactively, don't do anything
[[ -z "$PS1" ]] && return

# don't put duplicate lines in the history. See bash(1) for more options ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace

# append to the history file, don't overwrite it
shopt -s histappend

# check the window size after each command and, if necessary, update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[[ -x /usr/bin/lesspipe ]] && eval "$(SHELL=/bin/sh lesspipe)"

PS1='\u@\h:\w\$ '

# enable color support of ls and also add handy aliases
if [[ -x /usr/bin/dircolors ]]; then
  test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
  alias ls='ls --color=auto'
  alias grep='grep --color=auto'
fi

# enable programmable completion features (you don't need to enable this, if it's already enabled in /etc/bash.bashrc and /etc/profile sources /etc/bash.bashrc).
## [[ -f /etc/bash_completion ]] && ! shopt -oq posix && . /etc/bash_completion

# Alias definitions.
# You may want to put all your additions into a separate file like ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

[[ -f ~/.bash_aliases ]] && . ~/.bash_aliases
[[ -f ~/.bash_aliases_extend ]] && . ~/.bash_aliases_extend # try load optional alias extend
