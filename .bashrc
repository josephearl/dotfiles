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
hash "git-radar" 2>/dev/null && {
  export PS1="\[\033[1;32m\]→\[\033[0m\] \[\033[1;36m\]\$(basename \"\$(pwd)\")/\[\033[0m\]\$(git-radar --bash --fetch) "
}

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

# asdf
export ASDF_DATA_DIR="$HOME/.asdf" 
hash "asdf" 2>/dev/null && {
  source "$(brew --prefix asdf)/libexec/asdf.sh"
  test -s "$ASDF_DATA_DIR/plugins/dotnet/set-dotnet-home.sh" && {
    source "$ASDF_DATA_DIR/plugins/dotnet/set-dotnet-home.sh"
  }
  test -s "$ASDF_DATA_DIR/plugins/java/set-java-home.sh" && {
    source "$ASDF_DATA_DIR/plugins/java/set-java-home.sh"
  }
}

# direnv
hash "direnv" 2>/dev/null && {
  eval "$(direnv hook bash)"
}

# podman
alias docker=podman
alias docker-compose=podman-compose

# Visual Studio Code
alias code="open -b com.microsoft.VSCode"
