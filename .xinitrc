# .xinitrc - Configures and launches X session

# Set Display
$HOME/bin/set_resolution-zbookg5-home.sh
# $HOME/.screenlayout/zbookg5-home-dock.sh
# xrandr --setprovideroutputsource modesetting NVIDIA-0
# xrandr --auto

# Set Audio
. $HOME/bin/set_audio_sink

# DWM Bar
# xsetroot -name " Loading... "
# $HOME/.local/src/dwm-bar/dwm_bar.sh &

# Load Compositor
picom -f -b

# Wallpaper
# nitrogen --restore &

# Load URxvt settings
[[ -f ~/.Xresources ]] && xrdb -load ~/.Xresources
# export QT_STYLE_OVERRIDE=adwaita
export QT_QPA_PLATFORMTHEME=qt5ct
export QT_FONT_DPI=96

# Load Keyring
. /etc/X11/xinit/xinitrc.d/50-systemd-user.sh
eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
export SSH_AUTH_SOCK

# Set Keyboard (Logitech)
# $HOME/bin/set_keyboard.sh

# Setup Wacom Tablet
# xsetwacom set "Wacom Intuos4 4x6 Pen stylus" rotate half

# Set Numlock
numlockx &

# OSD
volnoti

# Set Caps Lock to Escape
setxkbmap -option caps:escape &

# Unclutter mouse
unclutter -b

# Dunst Notifications
dunst &

# Other Startup Programs
dropbox &
syncthing -no-browser &

# Applets
nm-applet &
blueberry-tray &
redshift-gtk &

# Start i3
exec i3 --shmlog-size=26214400
# exec dwm
# DWM Run Loop
# while true; do
#     dwm 2> ~/.dwm-error.log
# done

#
# relaunch DWM if the binary changes, otherwise bail
# csum=$(sha1sum $(which dwm))
# new_csum=""
# while true
# do
#     if [ "$csum" != "$new_csum" ]
#     then
#         csum=$new_csum
#         dwm
#     else
#         exit 0
#     fi
#     new_csum=$(sha1sum $(which dwm))
#     sleep 0.5
# done
