# Auto configure a new MacOS X system (or update) with dotfiles

## ZSH Shell
![](https://raw.githubusercontent.com/thenitai/dotfiles/master/images/zsh.png)

## Neovim
![](https://raw.githubusercontent.com/thenitai/dotfiles/master/images/neovim.png)


## Installation:

```
curl --silent https://raw.githubusercontent.com/thenitai/dotfiles/master/install.sh | sh
```

## Features

* Installs or updates the complete system
* Installs homebrew (brew) and installs a lot of helpful libraries (git, mongodb, mysql, etc.). Additionally, installs multimedia libraries (ImageMagick, ffmpeg, exiftool, etc.)
* Installs the ZSH shell with oh-my-zsh and configures it with zgen and with lots of plugins for shell heaven
* Installs Neovim (as a replacement for Vim) and configures it with all you need developer goodies (too many to mention)
* Installs app with cask (Firefox, Chrome, SublimeText, RoboMongo, etc.)

## Requirements

* Install XCode & its Command Line Tools before running the script


## Acknowledgement

This repro was inspired by [Paul Miller's dotfiles](https://github.com/paulmillr/dotfiles). However, my dotfiles do not only configure the shell and suggest apps, it actually installs a new MacOS X system completely or updates it.

