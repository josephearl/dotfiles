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

# Dotfiles
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
eval "$(thefuck --alias)"

# hn-cli
alias hn='/usr/local/bin/hn --keep-open'

# rbenv
export RBENV_DIR="$HOME/.rbenv"
eval "$(rbenv init -)"

# pyenv
export PYENV_DIR="$HOME/.pyenv"
eval "$(pyenv init -)"

# nvm
export NVM_DIR="$HOME/.nvm"
. "$(brew --prefix nvm)/nvm.sh"

# jenv
export JENV_DIR="$HOME/.jenv"
eval "$(jenv init -)"

# SDKMAN!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$SDKMAN_DIR/bin/sdkman-init.sh" ]] && source "$SDKMAN_DIR/bin/sdkman-init.sh" || true

# Homebrew
brew_path=${PATH//$PYENV_DIR\/shims:/}
brew_path=${brew_path//$RBENV_DIR\/shims:/}
alias brew="PATH=\"${brew_path}\" brew"
