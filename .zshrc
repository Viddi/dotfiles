# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="steeef"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to disable command auto-correction.
# DISABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(fzf git)

source $ZSH/oh-my-zsh.sh

# User configuration
export PATH="$PATH:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin"
export PATH="$HOME/.cache/rebar3/bin:$PATH"
export PATH="$HOME/.local/lbin:$PATH"
export PATH="$HOME/.local/bin:$PATH"

# iTerm2
export LC_ALL=en_US.UTF-8  
export LANG=en_US.UTF-8

# mkdir, cd into it
mkcd() {
  mkdir -p "$*"
  cd "$*"
}

# Returns whether the given command is executable or aliased.
_has() {
  return $( whence $1 >/dev/null )
}

_append_to_path() {
  if [ -d $1 -a -z ${path[(r)$1]} ]; then
    path=($1 $path);
  fi
}

# fzf via local installation
if [ -e ~/.fzf ]; then
  _append_to_path ~/.fzf/bin
  source ~/.fzf/shell/key-bindings.zsh
  source ~/.fzf/shell/completion.zsh
fi

# fzf + rg configuration
if _has fzf && _has rg; then
  export FZF_DEFAULT_COMMAND='rg --files --follow --hidden --glob "!{.git/*}"'
  export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
  export FZF_ALT_C_COMMAND="$FZF_DEFAULT_COMMAND"
  export FZF_DEFAULT_OPTS='
    --color fg:255,bg:236,hl:84,fg+:255,bg+:236,hl+:215
    --color info:141,prompt:84,spinner:212,pointer:212,marker:212
  '
fi

[[ -r "/usr/share/z/z.sh" ]] && source /usr/share/z/z.sh

if [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
  exec startx
fi

# Aliases for git
alias gs="git status"
alias gcam="git commit -am"
alias gaa="git add -A"
alias gcm="git commit -m"
alias gf="git fetch"
alias gfo="git fetch origin"
alias gp="git push"
alias gpo="git push origin"
alias grh="git reset --hard"
alias gd="git diff"
alias gco="git checkout"

# Aliases for tmux
alias tls="tmux list-sessions"
alias tns="tmux new -s"
alias tat="tmux a -t"
alias tks="tmux kill-session -t"

# Helpers
alias rslstart="systemctl --user start rslsync"
alias rslstop="systemctl --user stop rslsync"
alias nvimrc="nvim ~/.config/nvim/init.vim"
alias vimrc="vim ~/.vimrc"
alias zshrc="nvim ~/.zshrc"
alias tmuxconf="nvim ~/.tmux.conf"
alias i3conf="nvim ~/.config/i3/config"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -f /opt/miniconda3/etc/profile.d/conda.sh ] && source /opt/miniconda3/etc/profile.d/conda.sh

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/homebrew/Caskroom/miniconda/base/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/homebrew/Caskroom/miniconda/base/etc/profile.d/conda.sh" ]; then
        . "/opt/homebrew/Caskroom/miniconda/base/etc/profile.d/conda.sh"
    else
        export PATH="/opt/homebrew/Caskroom/miniconda/base/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
