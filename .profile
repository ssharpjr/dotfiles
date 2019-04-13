# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# Environment Variables
export EDITOR="vim"
export VISUAL="vim"
export TERMINAL="urxvt"
export MYBROWSER="google-chrome"
export READER="zathura"
export FILE="vifm"

# Source ~/.bashrc
if [ -n "$BASH_VERSION" ]; then
  if [ -f "$HOME/.bashrc" ]; then
    . "$HOME/.bashrc"
  fi
fi

# Set PATH
if [ -d "$HOME/bin" ]; then
  PATH="$HOME/bin:$PATH"
fi

# Add directories to PATH
if [ -f ~/.bash_paths ]; then
  . ~/.bash_paths
fi

# Switch escape and caps if tty:
sudo -n loadkeys ~/.config/scripts/ttymaps.kmap

# Start mpd
[ ! -s ~/.config/mpd/pid ] && mpd

# Start X if i3 is not already running.
[ "$(tty)" = "/dev/tty1" ] && ! pgrep -x i3 > /dev/null && exec startx

