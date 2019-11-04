#!/usr/bin/env sh
# Profile file. Runs on login.

# Adds `~/.local/bin/` and all subdirectories to $PATH
export PATH="$PATH:$(du "$HOME/.local/bin/" | cut -f2 | tr '\n' ':' | sed 's/:*$//')"
export NODE_PATH="$NODE_PATH:/home/neuromante/.local/lib/node_modules"
export EDITOR="nvim"
export VISUAL=$EDITOR
export USE_EDITOR=$EDITOR
export TERMINAL="kitty"
export BROWSER="qutebrowser"
export READER="zathura"
export FILE="vifm"
export BIB="$HOME/Documents/LaTeX/uni.bib"
export REFER="$HOME/Documents/referbib"
export SUDO_ASKPASS="$HOME/.local/bin/tools/dmenupass"
export NOTMUCH_CONFIG="$HOME/.config/notmuch-config"
export GTK2_RC_FILES="$HOME/.config/gtk-2.0/gtkrc-2.0"
export LPASS_DISABLE_PINENTRY=1
export LPASS_ASKPASS=.local/bin/tools/dmenupass
export BAT_PAGER="less -RFS"
# More responsive toggle from normal to insert mode in vi-mode.
# We need a value not so low, to give surround commands time to fire.
export KEYTIMEOUT=40

# less/man colors
export LESS=-RS
export LESS_TERMCAP_mb="$(printf '%b' '[1;31m')"; a="${a%_}"
export LESS_TERMCAP_md="$(printf '%b' '[1;36m')"; a="${a%_}"
export LESS_TERMCAP_me="$(printf '%b' '[0m')"; a="${a%_}"
export LESS_TERMCAP_so="$(printf '%b' '[01;44;33m')"; a="${a%_}"
export LESS_TERMCAP_se="$(printf '%b' '[0m')"; a="${a%_}"
export LESS_TERMCAP_us="$(printf '%b' '[1;32m')"; a="${a%_}"
export LESS_TERMCAP_ue="$(printf '%b' '[0m')"; a="${a%_}"

# export FZF_DEFAULT_COMMAND='ag -il --nocolor --nogroup --unrestricted --hidden -g ""'
export FZF_DEFAULT_COMMAND='rg --smart-case --files-with-matches --color never --no-heading --no-ignore --hidden ""'
export FZF_DEFAULT_OPTS='--no-height --no-reverse --bind "€:execute-silent(notify-send {})"'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_T_OPTS="--preview-window hidden:wrap --preview '(cat {} || tree -aC {}) 2> /dev/null | head -200' --bind '?:toggle-preview'"
export FZF_CTRL_R_OPTS="--preview 'echo {}' --preview-window down:3:hidden:wrap --bind '?:toggle-preview'"
export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -200'"

# git prompt
export GIT_PS1_SHOWDIRTYSTATE=1
export GIT_PS1_SHOWSTASHSTATE=1
export GIT_PS1_SHOWUNTRACKEDFILES=1
export GIT_PS1_SHOWUPSTREAM="verbose"

# mpd >/dev/null 2>&1 &

# [ ! -f ~/.config/shortcutrc ] && shortcuts >/dev/null 2>&1

# echo "$0" | grep "bash$" >/dev/null && [ -f ~/.bashrc ] && source "$HOME/.bashrc"

# Start graphical server if i3 not already running.
[ "$(tty)" = "/dev/tty1" ] && ! pgrep -x i3 >/dev/null && exec startx

# Switch escape and caps if tty:
sudo -n loadkeys ~/.local/bin/ttymaps.kmap 2>/dev/null
