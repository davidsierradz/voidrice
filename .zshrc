#--------------------------------Oh-My-ZSH-------------------------------------# {{{
# Path to your oh-my-zsh installation.
ZSH=/usr/share/oh-my-zsh

ZSH_THEME="neurosimple"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Instant paste (careful with pasting urls).
DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
plugins=(colored-man-pages common-aliases docker docker-compose git gitfast yarn zsh-autosuggestions zsh-completions zsh-system-clipboard zsh-syntax-highlighting)

# User configuration
DEFAULT_USER=neuromante

ZSH_CACHE_DIR=$HOME/.cache/oh-my-zsh
if [[ ! -d $ZSH_CACHE_DIR ]]; then
  mkdir $ZSH_CACHE_DIR
fi

source $ZSH/oh-my-zsh.sh
#--------------------------------End Oh-My-ZSH---------------------------------#
#}}}

#--------------------------------VI Settings-----------------------------------# {{{
# Updates editor information when the keymap changes.
# function zle-keymap-select() {
#   # update keymap variable for the prompt
#   VI_KEYMAP=$KEYMAP
#   zle reset-prompt
#   zle -R
# }
# zle -N zle-keymap-select

# function vi-accept-line() {
#   VI_KEYMAP=main
#   zle accept-line
# }
# zle -N vi-accept-line

bindkey -v

# use custom accept-line widget to update $VI_KEYMAP
# bindkey -M vicmd '^J' vi-accept-line
# bindkey -M vicmd '^M' vi-accept-line

# allow v to edit the command line (standard behaviour)
# autoload -Uz edit-command-line
# zle -N edit-command-line
# bindkey -M vicmd 'v' edit-command-line

# allow ctrl-p, ctrl-n for navigate history (standard behaviour)
# bindkey '^P' up-history
# bindkey '^N' down-history

# allow ctrl-h, ctrl-w, backspace for char and word deletion (standard behaviour)
bindkey '^?' backward-delete-char
bindkey '^h' backward-delete-char
# bindkey '^w' backward-kill-word

# allow ctrl-r and ctrl-s to search the history
# bindkey '^r' history-incremental-search-backward
# bindkey '^s' history-incremental-search-forward

# allow ctrl-a and ctrl-e to move to beginning/end of line
bindkey '^a' beginning-of-line
bindkey '^e' end-of-line

# if mode indicator wasn't setup by theme, define default
# if [[ "$MODE_INDICATOR" == "" ]]; then
#   MODE_INDICATOR="%{$fg_bold[red]%}<%{$fg[red]%}<<%{$reset_color%}"
# fi

# function vi_mode_prompt_info() {
#   echo "${${VI_KEYMAP/vicmd/$MODE_INDICATOR}/(main|viins)/}"
# }

# More bindkeys for insert vi-mode.
bindkey -M viins '^P' up-line-or-beginning-search
bindkey -M viins '^N' down-line-or-beginning-search
bindkey -M viins "^[[3~" delete-char
bindkey -M viins "^k" kill-line
bindkey -M viins "^b" backward-char
bindkey -M viins "^f" forward-char
bindkey -M viins "^u" kill-whole-line
#--------------------------------End VI Settings-------------------------------#
#}}}

#--------------------------------Sourcings-------------------------------------# {{{
[ -f "$HOME/.config/shortcutrc" ] && source "$HOME/.config/shortcutrc" # Load shortcut aliases
[ -f "$HOME/.config/aliasrc" ] && source "$HOME/.config/aliasrc"
[ -f /usr/share/fzf/completion.zsh ] && source /usr/share/fzf/completion.zsh
[ -f /usr/share/fzf/key-bindings.zsh ] && source /usr/share/fzf/key-bindings.zsh
# For some reason bindkey -v breaks this plugin, so we source it after.
[ -f /usr/share/oh-my-zsh/custom/plugins/zsh-autopair/autopair.zsh ] && source /usr/share/oh-my-zsh/custom/plugins/zsh-autopair/autopair.zsh
#--------------------------------End Sourcings---------------------------------#
#}}}

#--------------------------------Functions-------------------------------------# {{{
# Fuzzy find all files to send to git add.
gafzf() {
  git add $(git status --untracked-files=all --porcelain=v1 | grep --perl-regexp "^ M|MM| D|\?{2}" | awk '{print $2}' | \
    fzf \
      --bind '?:toggle-preview' \
      --preview "git diff --exit-code {} && cat {}" \
      --height 90% \
      --reverse \
      --multi "$@")
}

# Using xargs to pass arguments to git patch for some reason is
# interpreting \n as n inside the interactive patch section, why?
# For now add another command:
gapafzf() {
  git add --patch $(git status -s | awk '{$1=""; print $0}' | fzf --height 50% --reverse --multi "$@")
}

dpsfzf() {
  docker ps --all | fzf --height 50% --reverse --multi | awk '{$2=""; print $1}'
}

# Ctrl-S to insert sudo in front of command in normal mode.
function prepend-sudo { # Insert "sudo " at the beginning of the line
  if [[ $BUFFER != "sudo "* ]]; then
    BUFFER="sudo $BUFFER"; CURSOR+=5
    zle -K viins
    xdotool key ctrl+e
  fi
}
zle -N prepend-sudo

# Ctrl-S to insert sudo in front of command in insert mode.
sudo_ (){
  BUFFER="sudo $BUFFER"
  CURSOR=$#BUFFER
}
zle -N sudo_

# Press <C-q> to autocomplete the next WORD.
function _emacs-forward-capital-word {
  local WORDCHARS="*?_-.:[]~=&;!#$%^(){}<>\\/\"'|@"
  zle emacs-forward-word
}
zle -N _emacs-forward-capital-word

# Press <C-w> to delete the current WORD.
function _backward-kill-capital-word {
  local WORDCHARS="*?_-.:[]~=&;!#$%^(){}<>\\/\"'|@"
  zle backward-kill-word
}
zle -N _backward-kill-capital-word

# go - cd into the directory of the selected file
go() {
  local file
  local dir
  file=$(fzf +m -q "$1") && dir=$(dirname "$file") && cd "$dir"
}

# fa - including hidden directories
fa() {
  local dir
  dir=$(find ${1:-.} -type d 2> /dev/null | fzf +m) && cd "$dir"
}

# Use C-y to open history and run the command.
fzf-history-widget-accept() {
  fzf-history-widget
  zle accept-line
}
zle -N fzf-history-widget-accept

# ALT-D - Paste the selected directory path into the command line
__fseldir() {
  local cmd="command find -L . -mindepth 1 \\( -path '*/\\\.*' -o -fstype 'sysfs' -o -fstype 'devfs' -o -fstype 'devtmpfs' -o -fstype 'proc' \\) -prune \
    -o -type d -print 2> /dev/null | cut -b3-"
  setopt localoptions pipefail 2> /dev/null
  eval "$cmd" | FZF_DEFAULT_OPTS="--height ${FZF_TMUX_HEIGHT:-40%} --reverse $FZF_DEFAULT_OPTS $FZF_ALT_C_OPTS" $(__fzfcmd) -m "$@" | while read item; do
  echo -n "${(q)item} "
  done
  local ret=$?
  echo
}

fzf-dirr-widget() {
  LBUFFER="${LBUFFER}$(__fseldir)"
  local ret=$?
  zle reset-prompt
  return $ret
}
zle -N fzf-dirr-widget

# Use like this: git log -- file GHFZF file
gh() {
  myVar=$(</dev/stdin)
  originalFile=$1
  echo -e $myVar | fzf --ansi --no-sort --reverse --multi --bind 'ctrl-s:toggle-sort' \
    --header 'Press CTRL-S to toggle sort' \
    --preview "grep -o \"[a-f0-9]\{7,\}\" <<< {} | xargs -I % sh -c \"git show % --color=always -- $originalFile\" | head -"$LINES |
    grep -o "[a-f0-9]\{7,\}"
}

function ol() {
  rg --smart-case --files-with-matches --color never --no-heading --no-ignore --hidden '' \
    | fzf --bind "::execute(awk '{print \"+\"NR\" \"FILENAME}' {} | fzf)+abort" \
    | xargs "$SHELL" -c '</dev/tty nvim "$@"' ignoreme
}

# Updates editor information when the keymap changes.
function zle-keymap-select() {
  zle reset-prompt
  zle -R
  # select_cursor
}
zle -N zle-keymap-select

function zle-line-init() {
  if (( ${+terminfo[smkx]} )) && (( ${+terminfo[rmkx]} )); then
    echoti smkx
  fi
  zle reset-prompt
  # select_cursor
}
zle -N zle-line-init

function zle-line-finish() {
  if (( ${+terminfo[smkx]} )) && (( ${+terminfo[rmkx]} )); then
    echoti rmkx
  fi
}
zle -N zle-line-finish

function glofzf() {
  glo -- $1 | gh $1
}
#--------------------------------End Functions---------------------------------#
#}}}

#--------------------------------Aliases---------------------------------------# {{{
alias -g GHFZF='| gh'
alias -g lastbranch='$(cat .git/lastbranch)'
#--------------------------------End Aliases-----------------------------------#
#}}}

#--------------------------------KeyBindings-----------------------------------# {{{
# Use backwards search in vi-mode (arrows?).
bindkey '^[[A' up-line-or-beginning-search
bindkey '^[[B' down-line-or-beginning-search

bindkey -M vicmd '^s' prepend-sudo

bindkey "^s" sudo_

# Press <C-Space> to autocomplete and execute command.
bindkey '^ ' autosuggest-execute

bindkey '^q' _emacs-forward-capital-word

# Press <M-q> to autocomplete the next word.
bindkey '^[q' forward-word

bindkey '^w' _backward-kill-capital-word

# Press <M-w> to delete the current word.
bindkey '^[w' backward-kill-word

# Press <M-s> to switch current char with last one.
bindkey '^[s' transpose-chars

bindkey '^y' fzf-history-widget-accept

bindkey '^[d' fzf-dirr-widget

# Vim Surround see: https://github.com/zsh-users/zsh/blob/master/Functions/Zle/surround
autoload -Uz surround
zle -N delete-surround surround
zle -N add-surround surround
zle -N change-surround surround
bindkey -a cs change-surround
bindkey -a ds delete-surround
bindkey -a ys add-surround
bindkey -M visual S add-surround

autoload -U select-quoted
zle -N select-quoted
for m in visual viopp; do
  for c in {a,i}{\',\",\`}; do
    bindkey -M $m $c select-quoted
  done
done

autoload -U select-bracketed
zle -N select-bracketed
for m in visual viopp; do
  for c in {a,i}${(s..)^:-'()[]{}<>bB'}; do
    bindkey -M $m $c select-bracketed
  done
done

bindkey -M vicmd ' ' edit-command-line
bindkey -M vicmd 'v' visual-mode
bindkey '^xe' edit-command-line
bindkey '^x^e' edit-command-line

# Better searching in command mode
bindkey -M vicmd '?' history-incremental-search-backward
bindkey -M vicmd '/' history-incremental-search-forward

# Beginning search with arrow keys
bindkey "^[OA" up-line-or-beginning-search
bindkey "^[OB" down-line-or-beginning-search
bindkey -M vicmd "k" up-line-or-beginning-search
bindkey -M vicmd "j" down-line-or-beginning-search

# Shift-Tab to go back in menus.
bindkey -M menuselect '^[[Z' reverse-menu-complete

# Ctr-P and Ctrl-N to move in complete menus.
bindkey -M menuselect '^P' up-line-or-history
bindkey -M menuselect '^N' down-line-or-history
#--------------------------------End KeyBindings-------------------------------#
#}}}

#--------------------------------Prompt----------------------------------------# {{{
# Ensure that the prompt is redrawn when the terminal size changes.
TRAPWINCH() {
  zle reset-prompt
  zle && zle -R
}
#--------------------------------End Prompt------------------------------------#
#}}}

#--------------------------------Variables-------------------------------------# {{{
# zsh autosugestions plugin settings

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=1'
ZSH_AUTOSUGGEST_STRATEGY=match_prev_cmd

# Remove forward-char widgets from ACCEPT
ZSH_AUTOSUGGEST_ACCEPT_WIDGETS=("${(@)ZSH_AUTOSUGGEST_ACCEPT_WIDGETS:#forward-char}")
ZSH_AUTOSUGGEST_ACCEPT_WIDGETS=("${(@)ZSH_AUTOSUGGEST_ACCEPT_WIDGETS:#vi-forward-char}")

# Add forward-char widgets to PARTIAL_ACCEPT
ZSH_AUTOSUGGEST_PARTIAL_ACCEPT_WIDGETS+=(forward-char)
ZSH_AUTOSUGGEST_PARTIAL_ACCEPT_WIDGETS+=(vi-forward-char)

ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)
#--------------------------------End Variables---------------------------------#
#}}}

#--------------------------------General---------------------------------------# {{{
# Reload completions.
autoload -U compinit && compinit

# enable completition for hidden files.
_comp_options+=(globdots)

HISTSIZE=10000000
SAVEHIST=10000000

setopt NO_FLOW_CONTROL
setopt BANG_HIST                 # Treat the '!' character specially during expansion.
setopt EXTENDED_HISTORY          # Write the history file in the ":start:elapsed;command" format.
setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire duplicate entries first when trimming history.
setopt HIST_IGNORE_DUPS          # Don't record an entry that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete old recorded entry if new entry is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a line previously found.
setopt HIST_IGNORE_SPACE         # Don't record an entry starting with a space.
setopt HIST_SAVE_NO_DUPS         # Don't write duplicate entries in the history file.
setopt HIST_REDUCE_BLANKS        # Remove superfluous blanks before recording entry.
setopt HIST_VERIFY               # Don't execute immediately upon history expansion.
unsetopt beep
unsetopt correct_all
setopt correct

# When offering typo corrections, do not propose anything which starts with an underscore (such as many of Zsh's shell functions)
CORRECT_IGNORE='_*'

# Disable ctrl-s and ctrl-q (in tty?).
stty -ixon
#--------------------------------End General-----------------------------------#
#}}}

# vim: set fdm=marker fmr={{{,}}} fdl=0 :
