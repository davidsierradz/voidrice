#!/usr/bin/env bash
stty -ixon # Disable ctrl-s and ctrl-q.
shopt -s autocd #Allows you to cd into directory merely by typing the directory name.
shopt -s histappend
HISTCONTROL=ignoreboth
PROMPT_COMMAND='history -a'
HISTSIZE= HISTFILESIZE= # Infinite history.
[ -f /usr/share/git/git-prompt.sh ] && source /usr/share/git/git-prompt.sh
PS1='[\W$(__git_ps1 " (%s)")]\$ '

[ -f /usr/share/fzf/completion.bash ] && source /usr/share/fzf/completion.bash
[ -f /usr/share/fzf/key-bindings.bash ] && source /usr/share/fzf/key-bindings.bash

[ -f "$HOME/.config/shortcutrc" ] && source "$HOME/.config/shortcutrc" # Load shortcut aliases
[ -f "$HOME/.config/aliasrc" ] && source "$HOME/.config/aliasrc"
