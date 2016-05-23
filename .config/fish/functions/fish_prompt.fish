# Prompt
function fish_prompt
    echo -n -s (set_color --bold green) → " " (set_color cyan) (basename (pwd))  (set_color normal) (git-radar --bash --fetch) " "
end
