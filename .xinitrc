[[ -f ~/.Xresources ]] && xrdb -load ~/.Xresources

eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
export SSH_AUTH_SOCK

# Set DISPLAY
systemctl --user set-environment DISPLAY=:0

# Set Numlock
numlockx &

# OSD
volnoti

# Replace "busy" cursor
xsetroot -cursor_name left_ptr

# exec i3
exec i3

