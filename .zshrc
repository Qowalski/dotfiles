# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/talkie/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# ZSH_THEME="simple"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Plugins {{{

# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git vi-mode)

# }}}

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Aliases {{{

# commands
alias ls='ls --color=auto'
alias vdir='vdir --color=auto'
alias grep='grep --color=auto'
alias compton='compton --config $HOME/.config/compton/config'
alias rm='rm -i'
alias rmm='rm -rI'
alias musb='mount /dev/sdd1 && echo "mounted sdd1 -> /run/media"'
alias umusb='umount /dev/sdd1 && echo "unmounted sdd1"'

# vim aliases. because it happens..
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
alias sl='cd $HOME/documents/suckless/ && echo "cd -- suckless"'
alias usb='cd /run/media/ && echo "cd -- media"'

# }}}

export PATH=$PATH:$HOME/.scripts/
export PATH=$PATH:$HOME/.scripts/i3/
export PATH=$PATH:$HOME/.scripts/dmenu/
export PATH=$PATH:$HOME/.scripts/games/

# Vi-mode {{{

function zle-keymap-select zle-line-init zle-line-finish {
    case $KEYMAP in
        vicmd) print -n -- "\e[2 q" ;;
        viins|main) print -n -- "\e[6 q" ;;
    esac

    zle reset-prompt
    zle -R
}

zle -N zle-line-init
zle -N zle-line-finish
zle -N zle-keymap-select

# }}}

# Prompt {{{

PROMPT='%(!.%{$fg[red]%}.%{$fg_bold[black]%}%n %{$fg_bold[blue]%})%~ $(git_prompt_info)%{$fg_bold[black]%}>%{$reset_color%} '

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}%{$fg_bold[yellow]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$fg_bold[blue]%}"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg_bold[red]%}✗ "
ZSH_THEME_GIT_PROMPT_CLEAN=" %{$fg_bold[green]%}✔ "

# }}}

# vim:foldmethod=marker
