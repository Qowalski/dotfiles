#         _       _ _
#   __  _(_)_ __ (_) |_ _ __ ___
#   \ \/ / | '_ \| | __| '__/ __|
#  _ >  <| | | | | | |_| | | (__
# (_)_/\_\_|_| |_|_|\__|_|  \___|

#!/bin/bash

# Resolution
xrandr --output DisplayPort-1 --primary --mode 1920x1080 --rate 144
xrandr --output HDMI-A-1 --mode 1920x1080 --rate 60

# settings
mouse-settings
setxkbmap us
setxkbmap -option caps:escape

# Xresources
[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources

# Windowmanager
exec i3
