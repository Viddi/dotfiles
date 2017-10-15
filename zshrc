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
plugins=(git)

source $ZSH/oh-my-zsh.sh
source /usr/local/Cellar/z/1.9/etc/profile.d/z.sh
source /home/viddi/.linuxbrew/Cellar/z/1.9/etc/profile.d/z.sh

# User configuration

export PATH="$HOME/.linuxbrew/bin:$PATH:$HOME/.linuxbrew/sbin:$PATH:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:$HOME/Library/Android/sdk/platform-tools"
export MANPATH="$HOME/.linuxbrew/share/man:$MANPATH"
export INFOPATH="$HOME/.linuxbrew/share/info:$INFOPATH"
# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# iTerm2
export LC_ALL=en_US.UTF-8  
export LANG=en_US.UTF-8

# mkdir, cd into it
mkcd () {
  mkdir -p "$*"
  cd "$*"
}

# Aliases for ssh
alias ssh-viddi="ssh root@162.243.248.182"

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

# Aliases for linux
alias xclip="xclip -selection c"

# Aliases for vim
alias vimnp="nvim --noplugin"
alias vima="nvim --cmd \"let android=1\""
alias vime="nvim --cmd \"let elixir=1\""

# Autogen
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
export XDG_DATA_DIRS="/home/viddi/.linuxbrew/share:$XDG_DATA_DIRS"
