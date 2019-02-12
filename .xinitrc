[[ -f ~/.Xresources ]] && xrdb -load ~/.Xresources


eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
export SSH_AUTH_SOCK

# Set display profile
~/bin/i3-work-displays.sh

# exec cinnamon-session
exec i3
