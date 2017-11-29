export ZPLUG_HOME=$HOME/.zplug
source $ZPLUG_HOME/init.zsh

zmodload zsh/zprof
zplug "zplug/zplug"
zplug "geometry-zsh/geometry"
zplug "sorin-ionescu/prezto", use:"init.zsh", hook-build:"ln -s $ZPLUG_HOME/repos/sorin-ionescu/prezto ~/.zprezto"
zplug "glidenote/hub-zsh-completion"
zplug load

~/.scripts/check_updates_dotfiles.sh

#Set GOPATH
export GOPATH="$HOME/.go"
export PATH="$PATH:$GOROOT/bin:$GOPATH/bin"

#My aliases

alias vim="nvim"
alias update_system="sudo apt-get update && sudo apt-get upgrade"
alias bi="bundler install"
alias be="bundler exec"
alias rake="bundle exec rake"
alias rdcm="be rake db:drop && be rake db:create && be rake db:migrate"
alias rrs="be rubocop -a && be rake spec"

alias ga="git add"
alias gaa="git add --all"
alias gb="git branch"
alias gc="git commit"
alias gco="git checkout"
alias gcp="git cherry-pick"
alias gd="git diff"
alias gdt="git difftool"
alias gl="git log"
alias gls="git log -oneline --abbrev-commit"
alias gm="git merge"
alias gp="git push"
alias gpl="git pull"
alias gpr="hub pull-request"
alias gpt="git push origin --tags"
alias grb="git rebase"
alias gst="git status"
alias gw="git wip"
alias gwp="git wip -p"
alias gdo="git diff-origin"
alias gsquash="git squash-feature"
alias gst="git status"

# hub hack
if (( $+commands[hub] )); then
  function git {
    hub "$@"
  }
fi

export PATH="$PATH:$HOME/.scripts/git"

#Phoenix aliases
alias mec="mix ecto.create"
alias med="mix ecto.drop"
alias mem="mix ecto.migrate"

GEOMETRY_PROMPT_PREFIX="%F{$GEOMETRY_COLOR_DIR}$USER@$HOST"

#paranoid android
export ANDROID_HOME=${HOME}/Android/Sdk
export PATH=${PATH}:${ANDROID_HOME}/tools
export PATH=${PATH}:${ANDROID_HOME}/platform-tools

#node
export PATH="$PATH:$HOME/.config/yarn/global/node_modules/.bin"
alias yarn_reset="rm -rf node_modules && yarn"

