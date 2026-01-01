# Start Tmux
if [ "$TMUX" = "" ]; then tmux; fi

# Source Plugins
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Set up zsh prompt style
fpath=(~/.config/zsh/ $fpath)
autoload -Uz prompt_purification_setup; prompt_purification_setup

# Enable zsh Directory stack
setopt AUTO_PUSHD           # Push the current directory visited on the stack.
setopt PUSHD_IGNORE_DUPS    # Do not store duplicates in the stack.
setopt PUSHD_SILENT         # Do not print the directory stack after pushd or popd.

# Vim Mapping for Completion, must be loaded before compinit
zmodload zsh/complist
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history

# Enable native Zsh Completion System
if type brew &>/dev/null; then
    FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

    autoload -Uz compinit
    compinit
fi

# Enable menu selection for completions
zstyle ':completion:*' menu select

# Editing Command Lines In Vim
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey -M vicmd v edit-command-line
# bindkey '\C-x\C-e' edit-command-line

# Activating Vi Mode
bindkey -v
export KEYTIMEOUT=1

cursor_mode() {
    # See https://ttssh2.osdn.jp/manual/4/en/usage/tips/vim.html for cursor shapes
    cursor_block='\e[2 q'
    cursor_beam='\e[6 q'

    function zle-keymap-select {
        if [[ ${KEYMAP} == vicmd ]] ||
            [[ $1 = 'block' ]]; then
            echo -ne $cursor_block
        elif [[ ${KEYMAP} == main ]] ||
            [[ ${KEYMAP} == viins ]] ||
            [[ ${KEYMAP} = '' ]] ||
            [[ $1 = 'beam' ]]; then
            echo -ne $cursor_beam
        fi
    }

    zle-line-init() {
        echo -ne $cursor_beam
    }

    zle -N zle-keymap-select
    zle -N zle-line-init
}

cursor_mode

# Clipboard integration for vi mode
# This syncs yank/paste with system clipboard
function x11-clip-wrap-widgets() {
    # NB: Assume we are the first wrapper and that we only wrap native widgets
    # See https://github.com/zsh-users/zsh-autosuggestions/pull/141
    local copy_or_paste=$1
    shift

    for widget in $@; do
        if [[ $copy_or_paste == "copy" ]]; then
            eval "
            function _x11-clip-wrapped-$widget() {
                zle .$widget
                if [[ \$OSTYPE == darwin* ]]; then
                    echo \$CUTBUFFER | pbcopy
                else
                    echo \$CUTBUFFER | xclip -selection clipboard
                fi
            }
            "
        else
            eval "
            function _x11-clip-wrapped-$widget() {
                if [[ \$OSTYPE == darwin* ]]; then
                    CUTBUFFER=\$(pbpaste)
                else
                    CUTBUFFER=\$(xclip -o -selection clipboard)
                fi
                zle .$widget
            }
            "
        fi

        zle -N $widget _x11-clip-wrapped-$widget
    done
}

# Wrap copy widgets
local copy_widgets=(
    vi-yank vi-yank-eol vi-delete vi-backward-kill-word vi-change-whole-line
)
x11-clip-wrap-widgets copy $copy_widgets

# Wrap paste widgets
local paste_widgets=(
    vi-put-after vi-put-before
)
x11-clip-wrap-widgets paste $paste_widgets

# Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)

# fzf stuff
bindkey "ç" fzf-cd-widget

fzf-full() {
  fzf --style full \
    --border --padding 1,2 \
    --border-label ' fzf ' --input-label ' Input ' --header-label ' File Type ' \
    --preview 'fzf-preview.sh {}' \
    --bind 'result:transform-list-label:
        if [[ -z $FZF_QUERY ]]; then
          echo " $FZF_MATCH_COUNT items "
        else
          echo " $FZF_MATCH_COUNT matches for [$FZF_QUERY] "
        fi
        ' \
    --bind 'focus:transform-preview-label:[[ -n {} ]] && printf " Previewing [%s] " {}' \
    --bind 'focus:+transform-header:file --brief {} || echo "No file selected"' \
    --bind 'ctrl-r:change-list-label( Reloading the list )+reload(sleep 2; git ls-files)' \
    --color 'border:#aaaaaa,label:#cccccc' \
    --color 'preview-border:#9999cc,preview-label:#ccccff' \
    --color 'list-border:#669966,list-label:#99cc99' \
    --color 'input-border:#996666,input-label:#ffcccc' \
    --color 'header-border:#6699cc,header-label:#99ccff'
}

alias fzf=fzf-full

# yazi stuff
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
	rm -f -- "$tmp"
}

alias yazi=y

