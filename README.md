# dotfiles

[@josephearl](https://twitter.com/josephearl)’s dotfiles.

## Getting started

To replicate this configuration on a new machine:

    git clone --separate-git-dir=$HOME/.dotfiles https://github.com/JosephEarl/dotfiles ~

## Modifying dotfiles

To add a new dotfile:

    dotfiles add <filename>

To commit and push changes:

    dotfiles commit -m <message>
    dotfiles push

## Creating your own dotfiles

To create your own dotfiles repo like this from scratch:

    git init --separate-git-dir=<git-repo-path> ~

Then add the following to your `.bashrc` or similar:

    alias dotfiles='/usr/bin/git --git-dir=<git-repo-path> --work-tree=$HOME'
