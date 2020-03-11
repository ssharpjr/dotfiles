# .xinitrc - Configures and launches X session

# Set Display
# $HOME/.screenlayout/work-dock-850g4.sh
# $HOME/bin/set_resolution.sh
$HOME/.screenlayout/zbookg5-docked.sh
# xrandr --setprovideroutputsource modesetting NVIDIA-0
# xrandr --auto

# Load URxvt settings
[[ -f ~/.Xresources ]] && xrdb -load ~/.Xresources

# Load Keyring
# . /etc/X11/xinit/xinitrc.d/50-systemd-user.sh
# eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
# export SSH_AUTH_SOCK

# Set Keyboard
$HOME/bin/set_keyboard.sh

# Set Numlock
numlockx

# OSD
volnoti

# Replace "busy" cursor
# xsetroot -cursor_name left_ptr

# Set Caps Lock to Escape
setxkbmap -option caps:escape

# Start i3
exec i3

