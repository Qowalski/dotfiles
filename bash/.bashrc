#    _               _
#   | |__   __ _ ___| |__  _ __ ___
#   | '_ \ / _` / __| '_ \| '__/ __|
#  _| |_) | (_| \__ \ | | | | | (__
# (_)_.__/ \__,_|___/_| |_|_|  \___|

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

## General       |{{{
export TERMINAL="st"
export EDITOR="vim"
export BROWSER="firefox"
export LANG="en_US"
export PROMPT_DIRTRIM=3


## }}}
## Scripts       |{{{

colors() {
    printf "\e[37m┌───────┬───────┐\e[m\n"

    for i in {0..7}; do
        [[ $i -lt 10 ]] \
            && printf "\e[37m│\e[m  " \
            ||  printf "\e[37m│\3[m "
        printf "$prefix$i $(tput setaf $i)██$(tput sgr0) \e[37m│\e[m"

        let "j=$i+8"
        [[ $j -lt 10 ]] && printf "  " ||  printf " "
        printf "$prefix$j $(tput setaf $j)██$(tput sgr0) \e[37m│\e[m\n"
    done

    printf "\e[37m└───────┴───────┘\e[m\n"
}

__job_count() {
    count=$(jobs | wc -l)
    [[ ${count} -gt 0 ]] \
        && printf "${count}" \
        || printf "$"
}


## }}}
## Shell options |{{{

shopt -s autocd
shopt -s cdspell
shopt -s dirspell
stty -ixon


## }}}
## Aliases       |{{{

# commands
alias ls='ls --color=auto'
alias vdir='vdir --color=auto'
alias grep='grep --color=auto'
alias compton='compton --config $HOME/.config/compton/config'
alias rm='rm -i'
alias rmm='rm -rI'
alias musb='mount /dev/sdd1 && echo "mounted sdd1 -> /run/media"'
alias umusb='umount /dev/sdd1 && echo "unmounted sdd1"'

# git
alias ginit='git init'
alias gstatus='git status'
alias glog='git log'
alias gadd='git add'
alias gcommit='git commit -m'
alias gstash='git stash'
alias gcheckout='git checkout'
alias gswitch='git switch'
alias gbranch='git branch'
alias gpull='git pull'
alias gpush='git push'

# vim aliases. because it happens..
alias ":w"='echo -e "\e[1;30;41mThis is not VIM!\e[m"'
alias ":q"='exit'
alias ":wq"='exit'
alias ":Q"='echo -e "\e[1;30;41mE498: Not an editor command: Q\e[m"'
alias ":Wq"='echo -e "\e[1;30;41mE492: Not an editor command: Wq\e[m"'

# directories
alias .c='cd $HOME/.config/ && echo "cd -- .config"'
alias .s='cd $HOME/.scripts/ && echo "cd -- .scripts"'
alias dl='cd $HOME/downloads/ && echo "cd -- downloads"'
alias dm='cd $HOME/documents/ && echo "cd -- documents"'
alias pt='cd $HOME/pictures/ && echo "cd -- pictures"'


## }}}
## Prompts       |{{{

if [ -d /usr/share/git/ ]; then
    source /usr/share/git/git-prompt.sh
    source /usr/share/git/completion/git-completion.bash

    GIT_PS1_SHOWSTASHSTATE=1
    GIT_PS1_SHOWUNTRACKEDFILES=1
    GIT_PS1_SHOWCOLORHINTS=1

    PROMPT_COMMAND='__git_ps1 "\[\e[1;34m\]\w\[\e[m\]" " \[\e[1;33m\]$(__job_count)\[\e[m\] "'
else
    PS1='\[\e[1;34m\]\w \[\e[1;33m\]$(__job_count)\[\e[m\] '
fi

PS2='\[\e[1;33m\]\$ \[\e[m\]'


## }}}
## Path's        |{{{

export PATH=$PATH:$HOME/.scripts/
export PATH=$PATH:$HOME/.scripts/i3/
export PATH=$PATH:$HOME/.scripts/dmenu/


## }}}

# vim:foldmethod=marker
