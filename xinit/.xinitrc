#         _       _ _
#   __  _(_)_ __ (_) |_ _ __ ___
#   \ \/ / | '_ \| | __| '__/ __|
#  _ >  <| | | | | | |_| | | (__
# (_)_/\_\_|_| |_|_|\__|_|  \___|

#!/bin/bash

# General       |{{{
    [[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources


# General       |}}}
# Output        |{{{
    set_output() {
        output=${1}
        rate=${2}
        [[ ${3} == primary ]] && primary="--primary" || primary=""

        if [[ -n $(xrandr | grep -io ${1}) ]]; then
            xrandr --output ${output} ${primary} --mode 1920x1080 --rate ${rate}
        fi
    }

    # Desktop
    set_output DisplayPort-1 144 primary
    set_output HDMI-A-1 60

    # Laptop
    set_output eDP1 144 primary


## Output      |}}}
## IO Settings |{{{
    mouse-settings
    setxkbmap us
    setxkbmap -option caps:escape


## IO Settings |}}}

exec i3
