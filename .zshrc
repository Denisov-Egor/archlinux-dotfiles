# ==========================================================
# FASTIK ZSH
# ==========================================================

# ----------------------------------------------------------
# HISTORY
# ----------------------------------------------------------

HISTFILE="$HOME/.zsh_history"
HISTSIZE=50000
SAVEHIST=50000

setopt APPEND_HISTORY
setopt SHARE_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_REDUCE_BLANKS
setopt HIST_VERIFY


# ----------------------------------------------------------
# NAVIGATION
# ----------------------------------------------------------

setopt AUTO_CD
setopt AUTO_PUSHD
setopt PUSHD_IGNORE_DUPS
setopt PUSHD_SILENT


# ----------------------------------------------------------
# COMPLETION
# ----------------------------------------------------------

autoload -Uz compinit
compinit

zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'


# ----------------------------------------------------------
# STARSHIP
# ----------------------------------------------------------

eval "$(starship init zsh)"


# ----------------------------------------------------------
# ZOXIDE
# ----------------------------------------------------------

eval "$(zoxide init zsh)"


# ----------------------------------------------------------
# FZF
# ----------------------------------------------------------

export FZF_DEFAULT_OPTS='
--height 45%
--layout=reverse
--border=rounded
--info=inline
--prompt="❯ "
--pointer="▶"
--marker="✓"
'

source <(fzf --zsh)


# ----------------------------------------------------------
# ZSH AUTOSUGGESTIONS
# ----------------------------------------------------------

source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#555b6e'


# ----------------------------------------------------------
# ZSH SYNTAX HIGHLIGHTING
# ----------------------------------------------------------

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


# ----------------------------------------------------------
# YAZI
# ----------------------------------------------------------

function y() {
    local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"

    yazi "$@" --cwd-file="$tmp"

    if read -r cwd < "$tmp" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
        builtin cd -- "$cwd"
    fi

    rm -f -- "$tmp"
}


# ----------------------------------------------------------
# FZF DIRECTORY SEARCH
# ----------------------------------------------------------

function cdf() {
    local dir
    dir=$(fd --type d --hidden --exclude .git | fzf)

    if [ -n "$dir" ]; then
        cd "$dir"
    fi
}


# ----------------------------------------------------------
# FZF FILE + NEOVIM
# ----------------------------------------------------------

function fvim() {
    local file
    file=$(fd --type f --hidden --exclude .git | fzf)

    if [ -n "$file" ]; then
        nvim "$file"
    fi
}


# ----------------------------------------------------------
# ARCHIVES
# ----------------------------------------------------------

function extract() {
    if [ -f "$1" ]; then
        case "$1" in
            *.tar.bz2) tar xjf "$1" ;;
            *.tar.gz)  tar xzf "$1" ;;
            *.tar.xz)  tar xJf "$1" ;;
            *.tar)     tar xf "$1" ;;
            *.zip)     unzip "$1" ;;
            *.7z)      7z x "$1" ;;
            *.rar)     unrar x "$1" ;;
            *)
                echo "Неизвестный архив: $1"
                ;;
        esac
    else
        echo "Файл не найден: $1"
    fi
}


# ==========================================================
# ALIASES
# ==========================================================

# ----------------------------------------------------------
# Navigation
# ----------------------------------------------------------

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'


# ----------------------------------------------------------
# Files
# ----------------------------------------------------------

alias l='ls --color=auto'
alias ll='ls -lah --color=auto'
alias la='ls -A --color=auto'


# ----------------------------------------------------------
# Terminal
# ----------------------------------------------------------

alias c='clear'


# ----------------------------------------------------------
# Neovim
# ----------------------------------------------------------

alias v='nvim'
alias vi='nvim'
alias vim='nvim'


# ----------------------------------------------------------
# Yazi
# ----------------------------------------------------------

alias yy='y'


# ----------------------------------------------------------
# Search
# ----------------------------------------------------------

alias search='ddgr'


# ----------------------------------------------------------
# Media
# ----------------------------------------------------------

alias play='mpv'


# ----------------------------------------------------------
# PDF
# ----------------------------------------------------------

alias pdftext='pdftotext'
alias pdfinfo='pdfinfo'


# ----------------------------------------------------------
# Git
# ----------------------------------------------------------

alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gp='git push'
alias gpl='git pull'

alias gl='git log --oneline --graph --decorate --all'

alias gd='git diff'


# ----------------------------------------------------------
# ZELLIJ
# ----------------------------------------------------------

alias zj='zellij'


# ----------------------------------------------------------
# ARCH
# ----------------------------------------------------------

alias update='sudo pacman -Syu'
alias install='sudo pacman -S'
alias remove='sudo pacman -Rns'
alias searchpkg='pacman -Ss'


# ----------------------------------------------------------
# CLIPBOARD
# ----------------------------------------------------------

alias copy='wl-copy'
alias paste='wl-paste'


# ----------------------------------------------------------
# FASTFETCH
# ----------------------------------------------------------

alias neofetch='fastfetch'


# ==========================================================
# ENVIRONMENT
# ==========================================================

export EDITOR='nvim'
export VISUAL='nvim'

export PAGER='less -R'
export MANPAGER='less -R'

export LESS='-R'export PATH="$HOME/.local/npm/bin:$PATH"
