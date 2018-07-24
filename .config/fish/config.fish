# Terminal Colors
export LSCOLORS=GxFxCxDxBxegedabagaced
set fish_color_normal F8F8F2 # the default color
set fish_color_command F92672 # the color for commands
set fish_color_quote E6DB74 # the color for quoted blocks of text
set fish_color_redirection AE81FF # the color for IO redirections
set fish_color_end F8F8F2 # the color for process separators like ';' and '&'
set fish_color_error F8F8F2 --background=F92672 # the color used to highlight potential errors
set fish_color_param A6E22E # the color for regular command parameters
set fish_color_comment 75715E # the color used for code comments
set fish_color_match F8F8F2 # the color used to highlight matching parenthesis
set fish_color_search_match --background=49483E # the color used to highlight history search matches
set fish_color_operator AE81FF # the color for parameter expansion operators like '*' and '~'
set fish_color_escape 66D9EF # the color used to highlight character escapes like '\n' and '\x70'
set fish_color_cwd 66D9EF # the color used for the current working directory in the default prompt
# Additionally, the following variables are available to change the highlighting in the completion pager:
set fish_pager_color_prefix F8F8F2 # the color of the prefix string, i.e. the string that is to be completed
set fish_pager_color_completion 75715E # the color of the completion itself
set fish_pager_color_description 49483E # the color of the completion description
set fish_pager_color_progress F8F8F2 # the color of the progress bar at the bottom left corner
set fish_pager_color_secondary F8F8F2 # the background color of the every second completion

# Include local bin
set PATH '/usr/local/bin' $PATH
set PATH '/usr/local/sbin' $PATH

# dotfiles
complete --command dotfiles --wraps git
dotfiles config status.showUntrackedFiles no

# thefuck
eval (thefuck --alias | tr '\n' ';')

# hn-cli
alias hn='/usr/local/bin/hn --keep-open'

# rbenv
set -xU RBENV_DIR "$HOME/.rbenv"
status --is-interactive; and . (rbenv init -|psub)

# pyenv
set -xU PYENV_DIR "$HOME/.pyenv"
status --is-interactive; and . (pyenv init -|psub)

# nvm
set -xU NVM_DIR "$HOME/.nvm"
bass . (brew --prefix nvm)/nvm.sh
function __check_nvm --on-variable PWD --description 'Use nvm version specified in .nvmrc'
  if test -f .nvmrc
    set node_version (nvm version)
    set nvmrc_node_version (nvm version (cat .nvmrc))

    if [ $nvmrc_node_version = "N/A" ]
      nvm install
    else if [ $nvmrc_node_version != $node_version ]
      nvm use
    end
  end
end

# To check current dir upon Fish session start
__check_nvm

# jenv
set -xU JENV_DIR "$HOME/.jenv"

# SDKMAN!
set -xU SDKMAN_DIR "$HOME/.sdkman"
test -s "SDKMAN_DIR/bin/sdkman-init.sh"; and sdkman-init

# direnv
eval (direnv hook fish)
