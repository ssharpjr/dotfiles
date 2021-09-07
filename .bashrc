# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# Sudo completion
complete -cf sudo

# Set vim mode in bash
set -o vi

# Variables
export VISUAL=vim
export EDITOR=vim

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
# if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
#     debian_chroot=$(cat /etc/debian_chroot)
# fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm|xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls -hN --color=auto --group-directories-first'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'


# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias l1='ls -A1'
alias lss='ls -A1'
alias lls='ls -A1'

# Gruvbox color palette
# source "$HOME/.vim/bundle/gruvbox/gruvbox_256palette.sh"

# Prompt
# export PS1="\[$(tput bold)\]\[$(tput setaf 1)\][\[$(tput setaf 3)\]\u\[$(tput setaf 2)\]@\[$(tput setaf 4)\]\h \[$(tput setaf 5)\]\W\[$(tput setaf 1)\]]\[$(tput setaf 7)\]\\$ \[$(tput sgr0)\]"

# Powerline-shell
# function _update_ps1() {
#     PS1=$(powerline-shell $?)
# }

# if [[ $TERM != linux && ! $PROMPT_COMMAND =~ _update_ps1 ]]; then
#     PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
# fi

# Virtualenv
export WORKON_HOME=~/.virtualenvs
source /usr/bin/virtualenvwrapper.sh


# Directories
# export RYZOMDIR=~/.local/share/Ryzom
export WRITEDIR=~/Dropbox/Writing

# Load dircolors
test -r "~/.dir_colors" && eval $(dircolors ~/.dir_colors)

# Oracle Instantclient
# export ORACLE_HOME="/usr/lib/oracle/11.2/client64"
# export TNS_ADMIN="$ORACLE_HOME/network/admin"
# export LD_LIBRARY_PATH="$ORACLE_HOME/lib"
# export PATH=$PATH:$ORACLE_HOME/bin

# Toolchains
# export PATH=/home/ssharp/odroid/toolchains/gcc-linaro-arm-linux-gnueabihf-4.9-2014.09_linux/bin:$PATH
# export CROSS_COMPILE=arm-linux-gnueabihf-
# export ARCH=arm
# export PATH=$HOME/dev/rpi/kernel-dev/cc-tools/arm-bcm2708/gcc-linaro-arm-linux-gnueabihf-raspbian-x64/bin:$PATH

# PATH=$PATH:/home/ssharp/dev/rpi/kernel-dev/tools/arm-bcm2708/gcc-linaro-arm-linux-gnueabihf-raspbian-x64/bin
# PATH=$PATH:/home/ssharp/dev/rpi/kernel-dev/rpf/tools/arm-bcm2708/gcc-linaro-arm-linux-gnueabihf-raspbian-x64/bin

export PATH=/home/ssharp/src/muddler/muddle-shadow-0.5/bin:$PATH

export PATH=$HOME/.local/bin:$PATH
# PATH="/home/ssharp/perl5/bin${PATH:+:${PATH}}"; export PATH;
# PERL5LIB="/home/ssharp/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
# PERL_LOCAL_LIB_ROOT="/home/ssharp/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
# PERL_MB_OPT="--install_base \"/home/ssharp/perl5\""; export PERL_MB_OPT;
# PERL_MM_OPT="INSTALL_BASE=/home/ssharp/perl5"; export PERL_MM_OPT;

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/ssharp/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/ssharp/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/ssharp/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/ssharp/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# Azure CLI Tab Complete
# source /home/ssharp/.cache/yay/azure-cli/src/azure-cli/az.completion
