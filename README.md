# dotfiles

[@josephearl](https://twitter.com/josephearl)’s dotfiles.

## Getting started

**Requirements: Git and Homebrew already installed.**

To replicate this configuration on a new machine initialise and fetch the repository:

    git init --bare .dotfiles
    alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME'
    dotfiles remote add origin https://github.com/JosephEarl/dotfiles
    dotfiles fetch

Remove any existing conflicting files:

    rm .bashrc
    ...

Checkout the master branch:

    dotfiles checkout master

Load the latest settings:

    source .bashrc

Install the software and OS X settings:

    dotfiles install

## Installed software

### Fish shell

Set as default shell. Installed with Homebrew (see below).

### OS X settings

### Homebrew

`fish
bash
bash-completion
gnu-sed --with-default-names
vim --override-system-vi
homebrew/dupes/apple-gcc42
homebrew/dupes/grep
homebrew/dupes/openssh
homebrew/dupes/screen
homebrew/php/php56 --with-gmp
coreutils
findutils
ack
tree
wget
git
git-lfs
gibo
imagemagick --with-webp
lynx
lcov
testssl
thefuck
michaeldfallen/formula/git-radar
node
nvm
phantomjs
golang
gvm
python
python3
pyenv
ruby
rbenv
ruby-build
jenv
mysql
sqlite`

### Homebrew casks

`vlc
skype
google-chrome
transmission
transmit
mou
dash
java
virtualbox
intellij-idea
android-studio
pycharm
xamarin-studio
xamarin-android
xamarin-ios
xamarin-android-player
xamarin-mdk
xamarin-jdk
cocoapods
sequel-pro`

### Global node modules

`@rafaelrinaldi/hn-cli
cordova
ionic@beta
ios-sim
ios-deploy
angular-cli
react-native-cli
react-cli
react
grunt-cli
gulp-cli
karma-cli`

### Ruby gems

`bundler`

### SDKMAN!

`groovy
scala
kotlin
gradle
maven
ant
sbt`

## Modifying dotfiles

To add a new dotfile:

    dotfiles add <filename>

To commit and push changes:

    dotfiles commit -m <message>
    dotfiles push origin master

### Backing up Atom packages

    apm list --installed --bare > .atom/packages.list

### Backing up Homebrew packages and casks

    brew leaves
    brew cask list

## Creating your own dotfiles

To create your own dotfiles repo like this:

    git init --bare .dotfiles
    alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME'
    dotfiles config status.showUntrackedFiles no

You can use any other path instead of `$HOME/.dotfiles` to store the Git configuration for your dotfiles.
