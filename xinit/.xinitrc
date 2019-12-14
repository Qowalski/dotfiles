#         _       _ _
#   __  _(_)_ __ (_) |_ _ __ ___
#   \ \/ / | '_ \| | __| '__/ __|
#  _ >  <| | | | | | |_| | | (__
# (_)_/\_\_|_| |_|_|\__|_|  \___|
#

# Merge .Xresources
[ -f ~/.Xresources ] && xrdb -merge ~/.Xresources

# Host specific settings
case "$(hostname)" in
    tapcie)
        xrandr --output DisplayPort-1 --primary --mode 1920x1080 --rate 144
        xrandr --output HDMI-A-1 --mode 1920x1080 --rate 60
        ;;

    tanoie)
        xrandr --output eDP1 --primary --mode 1920x1080 --rate 144
        toggletouch &
esac

# Mouse and keyboard settings
mouse-settings &
setxkbmap us -option caps:swapescape

# Start i3
exec i3

# vim:ft=sh
