# -----------------------------------------------------------------------------
# ASDF
# -----------------------------------------------------------------------------
if [ -d "$HOME/.asdf" ]; then
   source "$HOME/.asdf/asdf.sh"
   source "$HOME/.asdf/completions/asdf.bash"
fi

# -----------------------------------------------------------------------------
# FZF
# -----------------------------------------------------------------------------
if [ -f "$HOME/.fzf.zsh" ]; then
   source "$HOME/.fzf.zsh"
fi

# Re-bind the fzf-file-widget from ^T to ^P. This makes it work just like
# in my vim configuration.
bindkey '^P' fzf-file-widget

if command -v bat > /dev/null 2>&1
then
    export FZF_CTRL_T_OPTS="--preview 'bat --style=numbers,changes  --line-range=:15 --color always {} 2> /dev/null'"
fi

# -----------------------------------------------------------------------------
# Go
# -----------------------------------------------------------------------------
if [ -d "/usr/local/go" ]
then
    export PATH="/usr/local/go/bin:$PATH"
fi

if which go > /dev/null; then
    if [ -e "/usr/local/opt/go/libexec/bin" ]; then
        export PATH="/usr/local/opt/go/libexec/bin:$PATH"
    fi
    export GOPATH="$HOME/go"
    export PATH="$GOPATH/bin:$PATH"
fi

# -----------------------------------------------------------------------------
# Utilities and user-local programs
# -----------------------------------------------------------------------------
if [ -d "$DOTFILES_DIR/bin" ]; then
    export PATH="$DOTFILES_DIR/bin:$PATH"
fi

if [ -d "$HOME/bin" ]; then
    export PATH="$HOME/bin:$PATH"
fi
# -----------------------------------------------------------------------------
# Local configuration and secrets
# -----------------------------------------------------------------------------
if [ -f "$HOME/.zsh_local" ];then
    source "$HOME/.zsh_local"
fi
