# Correct cd typos
shopt -s cdspell
# Update windows size on command
shopt -s checkwinsize
# Append History instead of overwriting file
shopt -s histappend
# Bash attempts to save all lines of a multiple-line command in the same history entry
shopt -s cmdhist
# No empty completion
shopt -s extglob
# No empty completion
shopt -s no_empty_cmd_completion

# Increase history size
export HISTSIZE=1000000
export HISTCONTROL='ignoreboth'
export HISTIGNORE='&:ls:[bf]g:exit'
export HISTTIMEFORMAT='%b %d %H:%M:%S: '

# Terminal Colors
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

# Prompt
export PS1="\[\033[1;32m\]→\[\033[0m\] \[\033[1;36m\]\$(basename \$(pwd))/\[\033[0m\]\$(git-radar --bash --fetch) "

# Include local bin
export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"

# Completion
source $HOME/.bash_completion

# dotfiles
function dotfiles {
  if [[ $@ == "install" ]]; then
    command bash "$HOME/.install/install.bash"
  else
    command git --git-dir="$HOME/.dotfiles" --work-tree="$HOME" "$@"
  fi
}
complete -o bashdefault -o default -o nospace -F __git_wrap__git_main dotfiles
dotfiles config status.showUntrackedFiles no

# thefuck
hash "thefuck" 2>/dev/null && {
  eval "$(thefuck --alias)"
}

# goenv
export GOENV_DIR="$HOME/.goenv"
hash "goenv" 2>/dev/null && {
  eval "$(goenv init - --no-rehash)"
}

# rbenv
export RBENV_DIR="$HOME/.rbenv"
hash "rbenv" 2>/dev/null && {
  eval "$(rbenv init - --no-rehash)"
}

# pyenv
export PYENV_DIR="$HOME/.pyenv"
hash "pyenv" 2>/dev/null && {
  eval "$(pyenv init - --no-rehash)"
}

# nvm
export NVM_DIR="$HOME/.nvm"
test -s "$(brew --prefix nvm)/nvm.sh" && {
  . "$(brew --prefix nvm)/nvm.sh"
}

# SDKMAN!
export SDKMAN_DIR="$HOME/.sdkman"
test -s "$SDKMAN_DIR/bin/sdkman-init.sh" && {
  source "$SDKMAN_DIR/bin/sdkman-init.sh"
}

# direnv
hash "direnv" 2>/dev/null && {
  eval "$(direnv hook bash)"
}

# Homebrew
brew_path=${PATH//$PYENV_DIR\/shims:/}
brew_path=${brew_path//$RBENV_DIR\/shims:/}
alias brew="PATH=\"${brew_path}\" brew"
