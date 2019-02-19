[[ -f ~/.Xresources ]] && xrdb -load ~/.Xresources

eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
export SSH_AUTH_SOCK

# Set Numlock
numlockx &

# Setup monitors
xrandr --output VIRTUAL1 --off --output eDP1 --primary --mode 1366x768 --pos 1920x0 --rotate normal --output DP1 --off --output HDMI2 --off --output HDMI1 --off --output DP1-3 --off --output DP1-2 --mode 1920x1080 --pos 3286x0 --rotate normal --output DP1-1 --mode 1920x1080 --pos 0x0 --rotate normal --output DP2 --off


# exec i3
exec i3
