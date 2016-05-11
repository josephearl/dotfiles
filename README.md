# dotfiles

[@josephearl](https://twitter.com/josephearl)’s dotfiles.

## Getting started

To replicate this configuration on a new machine initialise and fetch the repository:

    git init --bare .dotfiles
    alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME'
    dotfiles remote add origin https://github.com/JosephEarl/dotfiles
    dotfiles fetch

Remove any existing conflicting files:
    
    rm .bashrc
    ...

Finally checkout the master branch:

    dotfiles checkout master

## Modifying dotfiles

To add a new dotfile:

    dotfiles add <filename>

To commit and push changes:

    dotfiles commit -m <message>
    dotfiles push origin master

## Creating your own dotfiles

To create your own dotfiles repo like this:

    git init --bare .dotfiles
    alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME'
    dotfiles config status.showUntrackedFiles no

You can replace `~/.dotfiles` with any other path on your system