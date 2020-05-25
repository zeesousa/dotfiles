source "${HOME}/.zgen/zgen.zsh"

zmodload zsh/zprof

if ! zgen saved; then
  zgen prezto
  zgen load geometry-zsh/geometry

  zgen save
fi

# hookup direnv for .envrc
eval "$(direnv hook zsh)"

# ASDF
source $HOME/.asdf/asdf.sh

# Linux Brew
if [[ "$OSTYPE" == "linux-gnu" ]]; then
  export PATH="/home/linuxbrew/.linuxbrew/bin:$PATH"
  export MANPATH="/home/linuxbrew/.linuxbrew/share/man:$MANPATH"
  export INFOPATH="/home/linuxbrew/.linuxbrew/share/info:$INFOPATH"
fi

# Disabled once I can check a faster alternative
# ~/.scripts/check_updates_dotfiles.sh

#Set GOPATH
export GOPATH="$HOME/.go"
export PATH="$PATH:$GOROOT/bin:$GOPATH/bin"

#My aliases
source "$HOME/.zsh/aliases.sh"

# hub hack
if (( $+commands[hub] )); then
  function git {
    hub "$@"
  }
fi

# add my custom scripts to path
export PATH="$PATH:$HOME/.scripts/git"
export PATH="$PATH:$HOME/.scripts/bin"

# geometry stuff
GEOMETRY_PROMPT_PREFIX="%F{$GEOMETRY_COLOR_DIR}$USER"

#paranoid android
export ANDROID_HOME=${HOME}/Android/Sdk
export PATH=${PATH}:${ANDROID_HOME}/tools
export PATH=${PATH}:${ANDROID_HOME}/platform-tools

#node
export PATH="$PATH:$HOME/.config/yarn/global/node_modules/.bin"

# PIP
export PATH=~/.local/bin:$PATH

# gnome-terminal stuff
if [[ "$OSTYPE" == "linux-gnu" ]]; then
    test -d "/etc/profile.d/vte.sh" && . /etc/profile.d/vte.sh
fi

if grep -q Microsoft /proc/version; then
    keychain $HOME/.ssh/id_rsa
    source $HOME/.keychain/$HOST-sh
fi

