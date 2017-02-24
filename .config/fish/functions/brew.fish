function brew
  set brew_path $PATH
  set -e brew_path[1]
  set -e brew_path[1]
  begin
    set -lx PATH $brew_path
    command brew $argv
  end
end
