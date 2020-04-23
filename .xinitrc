# .xinitrc - Configures and launches X session

# Set Display
# $HOME/.screenlayout/work-dock-850g4.sh
# $HOME/bin/set_resolution.sh
$HOME/.screenlayout/zbookg5-docked.sh
# xrandr --setprovideroutputsource modesetting NVIDIA-0
# xrandr --auto

# Load URxvt settings
[[ -f ~/.Xresources ]] && xrdb -load ~/.Xresources
# export QT_STYLE_OVERRIDE=adwaita
export QT_QPA_PLATFORMTHEME=qt5ct
export QT_FONT_DPI=96

# Load Keyring
. /etc/X11/xinit/xinitrc.d/50-systemd-user.sh
eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
export SSH_AUTH_SOCK

# Set Keyboard
$HOME/bin/set_keyboard.sh

# Setup Wacom Tablet
xsetwacom set "Wacom Intuos4 4x6 Pen stylus" rotate half

# Set Numlock
numlockx

# OSD
volnoti

# Replace "busy" cursor
xsetroot -cursor_name left_ptr

# Set Caps Lock to Escape
setxkbmap -option caps:escape

# Start i3
exec i3 --shmlog-size=26214400

