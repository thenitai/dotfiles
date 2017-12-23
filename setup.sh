#!/bin/bash

dotfiles="$HOME/dotfiles"

if [[ -d "$dotfiles" ]]; then
  echo "Configuring it all for you"
else
  echo "The scripts don't seem to exist. Aborting..."
  exit 1
fi

# Run xcode-select --install
xcode-select --install

# Install homebrew
which -s brew
if [[ $? != 0 ]]; then
echo 'Installing Homebrew...'
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  brew update
  brew install git nodejs htop mysql nginx grc ctags the_silver_searcher python selenium-server-standalone elasticsearch mongodb ghostscript libtiff exiftool MP4Box ufraw dcraw neovim/neovim/neovim
  brew install imagemagick --with-libtiff
  brew install ffmpeg --use-clang --with-libvorbis --with-libvpx --use-gcc  --with-libx264 --with-flac --with-theorao
  brew tap caskroom/cask

# Installing ZSH
#echo 'Installing ZSH Shell...'
#sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

#Install fish
brew install fish

# Link ZSH config
#link "$dotfiles/ohmyzsh/.zshrc" "$HOME/."
#link "$dotfiles/ohmyzsh/.zshrc.d" "$HOME/."

# NEOVIM
echo 'Getting Neovim configured...'

# Create .config dir for nvim
mkdir -p "$HOME/.config"

# Link nvim directory
link "$dotfiles/nvim" "$HOME/.config/."


# Install Apps
echo 'Installing Apps...'
brew cask install google-chrome
brew cask install sublime-text
brew cask install atom
brew cask install firefox
brew cask install flux
brew cask install iterm2
brew cask install launchbar
brew cask install livechat
brew cask install mailplane
brew cask install moom
brew cask install noizio
brew cask install nvalt
brew cask install sequel-pro
brew cask install skitch
brew cask install textexpander
brew cask install transmission
brew cask install transmit
brew cask install viscosity
brew cask install vlc
brew cask install eoom
brew cask install sourcetree
brew cask install slack
brew cask install launchrocket

echo 'All done. Switching to ZSH...'

# All done. Switch shell
#chsh -s /bin/zsh

# Need to append fish shell to default shells
sudo sh -c 'echo "/usr/local/bin/fish" >> /etc/shells'

# All done. Switch shell
chsh -s /usr/local/bin/fish

# Function that does the symbolic links
link() {
  from="$1"
  to="$2"
  echo "Linking '$from' to '$to'"
  rm -f "$to"
  ln -s "$from" "$to"
}
