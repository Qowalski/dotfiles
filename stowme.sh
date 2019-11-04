#!/usr/bin/env sh

# Executes GNU's stow command but filters out all files listed in .stowignore.
# If target (-t, --target) is not set it will get set to ~ (/home/<user>).
# If used wihout any arguments it asks to stow all configs.

if [[ ! -f /bin/stow ]]; then
    echo "GNU's stow is not installed"
    exit 1
fi

args=${@}

if [[ ${#} -le 0 ]] \
    && [[ ! "${args[@]}" =~ "-S" && ! "${args[@]}" =~ "--stow" \
    && ! "${args[@]}" =~ "-D" && ! "${args[@]}" =~ "--delete" \
    && ! "${args[@]}" =~ "-R" && ! "${args[@]}" =~ "--restow" ]]
then
    args="$(ls) ${@}"
fi

IGNORE=$(cat .stowignore 2> /dev/null)
# HOME=~
TARGET="-t ${HOME}"

for arg in ${args[@]}; do
    for ig in ${IGNORE[@]}; do
        if [[ ${arg} == ${ig} ]]; then
            echo "Ignoring '${arg}'"
            args=( "${args[@]/$arg}" )
        fi
    done

    if [[ ${arg} == "-t" ]] || [[ ${arg} == "--target" ]]; then
        TARGET=""
    fi
done

echo -e "\e[1;31mstow ${args[@]} ${TARGET}\e[m" | tr "\n" " " | sed 's/\  */ /g; s/$/\n/g'
printf "proceed? [y/n] "
read user

if [[ ${user} == "y" ]]; then
    stow ${args[@]} ${TARGET}
fi
