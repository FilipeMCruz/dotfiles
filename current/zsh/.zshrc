#                                       __
#                            ___  ___  / /
#                           /_ / (_-< / _ \
#                           /__//___//_//_/
#
autoload -U promptinit
promptinit
prompt spaceship

SPACESHIP_CHAR_SYMBOL="→ "
SPACESHIP_CHAR_SYMBOL_ROOT="▶ "
SPACESHIP_CHAR_SYMBOL_SECONDARY="→ "

SPACESHIP_JOBS_SYMBOL="λ"
SPACESHIP_JOBS_COLOR="red"

#
# Aliases
#

source ~/.aliases

# Zsh to use the same colors as ls
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

#
# Basic auto/tab complete
#

zstyle ':completion:*' special-dirs true
zstyle ':completion:*' file-sort name
zstyle ':completion:*' list-suffixes true
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'r:|[._-]=** r:|=**'
zstyle ':completion:*' squeeze-slashes true
autoload -Uz compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)  # include dot files
zstyle ':completion:*' matcher-list 'm:{a-zA-Z-_}={A-Za-z_-}' 'r:|=*' 'l:|=* r:|=*'

#
# History
#

HISTSIZE=999999999
SAVEHIST=$HISTSIZE
HISTFILE='/home/fmcruz/.zsh_history'

setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_verify
setopt inc_append_history
setopt share_history

#
# Prompt
#

PROMPT='$NEWLINE%F{yellow}%B%n%f%F{blue}@%f%F{green}%B%m%f %F{blue}in%f %$(spaceship_prompt)'
RPROMPT='%F{red}%B[%f%F{yellow}%B$(date "+%H:%M %d/%m/%y")%f%F{red}%B]%f'

#
# Keybindings
#

autoload -Uz up-line-or-beginning-search
autoload -Uz down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

bindkey '^[[1;5D' backward-word # [Ctrl-LeftArrow] - move backward one word
bindkey '^[[1;5C' forward-word  # [Ctrl-RightArrow] - move forward one word
bindkey "${terminfo[kdch1]}" delete-char            # [Delete] - delete forward

bindkey "^[[A" up-line-or-beginning-search
bindkey "^[[B" down-line-or-beginning-search

bindkey "^[[F" end-of-line            # [End] - Go to end of line
bindkey "^[[H" beginning-of-line      # [Home] - Go to beginning of line

#
# Plugins
#

source /home/fmcruz/.zsh_plugins/colored-man-pages/colored-man-pages.plugin.zsh
source /home/fmcruz/.zsh_plugins/gitignore/gitignore.plugin.zsh
source /home/fmcruz/.zsh_plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh
source /home/fmcruz/.zsh_plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh
