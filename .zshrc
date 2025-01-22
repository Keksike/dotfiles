# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export EDITOR="cursor"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="dracula"

plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

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

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

function docker-bash-function {
    docker exec -it `docker ps -qf "name=$1"` /bin/bash
}

function docker-psql {
    docker exec -it `docker ps -qf "name=$1"` psql -U checkout
}

alias docker-bash=docker-bash-function

export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

function process-at-port {
    lsof -i tcp:$1
}

function kill-process-at-port {
    kill -9 $(lsof -t -i:$1)
}

die() {
    port=${1:-3000}
    pid=$(lsof -n -i4TCP:$port | grep -m 1 LISTEN | awk '{ print $2 }')
    kill -9 $pid
}

recent() {
    echo "${bold}Recent branches${normal}:"
    git for-each-ref --sort=-committerdate --count="${1:-10}" --format='%(refname:short)' refs/heads/
}

alias c='cursor'
alias zshrc="$EDITOR ~/.zshrc"

# Git
alias gbd='git branch -d'
alias gca='git commit --amend -C head'
alias gcc='git commit -C head'
alias gch='git checkout'
alias gchpl='gfa && gch origin/main pnpm-lock.yaml && pnpm i && gaa pnpm-lock.yaml'
alias gdc='git diff --cached'
alias gdn='gd --name-only'
alias gdn='git diff --name-only'
alias gf='git fetch'
alias gfa='git fetch --all'
alias gl='git log'
alias glg='git log --graph --pretty=oneline --all --abbrev-commit'
alias gn='git checkout -b'
alias gp='git pull'
alias gpm='git pull origin main:main'
alias gpnpm='gchpl && gc -m "chore: checkout pnpm-lock from main and pnpm i"'
alias gpsh='git push'
alias gpsht='scb && git push origin "$current_branch":test'
alias gpu='scb && git push --set-upstream origin $current_branch'
alias gr='git reset'
alias grb='git rebase'
alias grbc='git rebase --continue'
alias grbcn='git rebase --continue --no-edit'
alias grbm='gpm && grb main'
alias grhh='scb && git reset --hard origin/$current_branch'
alias gs='git status'
alias gst='git stash'
alias gstk='git stash --keep-index'