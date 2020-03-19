#                                       __
#                            ___  ___  / /
#                           /_ / (_-< / _ \
#                           /__//___//_//_/
#

# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="spaceship"

plugins=(
    git
    gitignore
    colored-man-pages
    zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

#
# Aliases
#

source ~/.aliases

# Zsh to use the same colors as ls
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

#
# Basic auto/tab complete
#

autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)  # include dot files

#
# History
#

HISTSIZE=999999999
SAVEHIST=$HISTSIZE

#
# Prompt
#

PROMPT='$NEWLINE%F{yellow}%n%f%F{#828997}@%f%F{green}%m%f %F{#828997}in%f %$(spaceship_prompt)'
RPROMPT='[%F{yellow}$(date "+%H:%M %d/%m/%y")%f]'

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
