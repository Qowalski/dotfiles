#!/usr/bin/env bash

# Executes GNU's stow command but filters out all files listed in .stowignore.
# If target (-t, --target) is not set it will get set to ~ (/home/<user>).
# If used wihout any arguments it asks to stow all configs.

if [[ ! -f /bin/stow ]]; then
    echo "GNU's stow is not installed"
    exit 1
fi

if [[ ${#} -le 0 ]]; then
    args=$(ls)
    # $0 * && exit 0
else
    args=${@}
fi

IGNORE=$(cat .stowignore 2> /dev/null)
HOME=~
TARGET="-t ${HOME}"

echo ${IGNORE[@]}

for arg in ${args[@]}; do
    if [[ ${IGNORE[@]} =~ ${arg} ]]; then
        echo "Ignoring '${arg}'"
        args=( "${args[@]/$arg}" )
    fi

    if [[ ${arg} == "-t" ]] || [[ ${arg} == "--target" ]]; then
        args=""
    fi
done

echo -e "\e[1;31mstow ${args[@]} ${TARGET}\e[m"
printf "execute? [y/n] "
read user

if [[ ${user} == "y" ]]; then
    stow ${args[@]} ${TARGET}
fi
