[[ -f ~/.Xresources ]] && xrdb -load ~/.Xresources

eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
export SSH_AUTH_SOCK

# Set DISPLAY
systemctl --user set-environment DISPLAY=:0

# Set Numlock
numlockx &

# OSD
volnoti

# exec i3
exec i3

# Switch Escape and CAPS
sudo -n loadkeys ~/.config/scripts/ttymaps.kmap 2>/dev/null
