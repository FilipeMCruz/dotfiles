#                                       __
#                            ___  ___  / /
#                           /_ / (_-< / _ \
#                           /__//___//_//_/
#
source /usr/lib/spaceship-prompt/spaceship.zsh

#
# Aliases
#

test -f ~/.aliases && source ~/.aliases

#
# Secrets
#

test -f ~/.secrets && source ~/.secrets

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
HISTFILE=$HOME'/.zsh_history'

setopt correct
setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_verify
setopt inc_append_history
setopt share_history

#
# Keybindings
#

# Alt+Backspace
backward-kill-dir () {
    local WORDCHARS=${WORDCHARS/\/}
    zle backward-kill-word
}
zle -N backward-kill-dir
bindkey '^H' backward-kill-dir

# Alt+Left
backward-word-dir () {
    local WORDCHARS=${WORDCHARS/\/}
    zle backward-word
}
zle -N backward-word-dir
bindkey '^[[1;5D' backward-word-dir

# Alt+Right
forward-word-dir () {
    local WORDCHARS=${WORDCHARS/\/}
    zle forward-word
}
zle -N forward-word-dir
bindkey "^[[1;5C" forward-word-dir

autoload -Uz up-line-or-beginning-search
autoload -Uz down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

bindkey "^[[1;3D" backward-word              # [Ctrl-LeftArrow] - move backward one word
bindkey '^[[1;3C' forward-word               # [Ctrl-RightArrow] - move forward one word
bindkey '^[^?'    backward-delete-word            # [Ctrl-Delete] - delete work

bindkey "^[[A" up-line-or-beginning-search
bindkey "^[[B" down-line-or-beginning-search

bindkey "^[[6~" end-of-line                  # [End] - Go to end of line
bindkey "^[[5~" beginning-of-line            # [Home] - Go to beginning of line

#
# Plugins
#
test -f ~/.zsh_plugins/zsh-fzf-history-search/zsh-fzf-history-search.plugin.zsh && source ~/.zsh_plugins/zsh-fzf-history-search/zsh-fzf-history-search.plugin.zsh
test -f ~/.zsh_plugins/colored-man-pages/colored-man-pages.plugin.zsh && source ~/.zsh_plugins/colored-man-pages/colored-man-pages.plugin.zsh
test -f ~/.zsh_plugins/gitignore/gitignore.plugin.zsh && source ~/.zsh_plugins/gitignore/gitignore.plugin.zsh
test -f ~/.zsh_plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh && source ~/.zsh_plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh
test -f ~/.zsh_plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh && source ~/.zsh_plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh


# Load Angular CLI autocompletion.
source <(ng completion script)
