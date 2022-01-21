# Load X resources (see https://wiki.archlinux.org/title/X_resources#xinitrc)
[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources

# Set enviroment variables for Xorg applications
export PATH="${PATH}:${HOME}/.xorg_scripts"

# Start udiskie for automounting of USB storage devices
# (see https://github.com/coldfix/udiskie/wiki/Usage)
udiskie -F &

# Disable bell sound
xset -b

# Start window manager
exec wmderland
#exec xterm
