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
which brew
if [[ $? != 0 ]]; then
  echo 'Installing Homebrew...'
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
fi

brew update
brew install git nodejs htop mysql python selenium-server-standalone elasticsearch ghostscript libtiff exiftool MP4Box ufraw dcraw redis memcached tomcat-native
brew install imagemagick@6
brew install ffmpeg --with-libvorbis --with-libvpx --use-gcc  --with-libx264 --with-flac --with-theorao
brew tap homebrew/cask-cask
brew install homebrew/cask-versions/java11
brew tap mongodb/brew
brew install mongodb-community@4.2

# Installing ZSH
echo 'Installing ZSH Shell...'
#sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

#Install fish
brew install fish

# Link ZSH config
#link "$dotfiles/ohmyzsh/.zshrc" "$HOME/."
#link "$dotfiles/ohmyzsh/.zshrc.d" "$HOME/."

# NEOVIM
#echo 'Getting Neovim configured...'

# Create .config dir for nvim
#mkdir -p "$HOME/.config"

# Link nvim directory
#link "$dotfiles/nvim" "$HOME/.config/."

#brew install zsh-autosuggestions

# Install Apps
echo 'Installing Apps...'
brew cask install firefox
brew cask install firefox-developer-edition
brew cask install google-chrome
brew cask install google-chrome-canary
brew cask install vivaldi
brew cask install safari-technology-preview
brew cask install sublime-text
brew cask install visual-studio-code
brew cask install iterm2
#brew cask install launchbar
brew cask install Alfred
brew cask install mailplane
brew cask install moom
brew cask install sequel-pro
brew cask install snagit
brew cask install textexpander
brew cask install transmission
brew cask install transmit
brew cask install vlc
brew cask install sourcetree
brew cask install gitkraken
brew cask install telegram
brew cask install the-clock
brew cask install onedrive
brew cask install Spotify
brew cask install homebrew/cask-drivers/sonos
brew cask install studio-3t
brew cask install cleanmymac
#brew cask install malwarebytes
brew cask install 1password
brew cask install arq
brew cask install little-snitch
brew cask install boom-3d
#brew cask install default-folder-x
brew cask install beyond-compare
brew cask install dash
brew cask install expressvpn
#brew cask install focusatwill
brew cask install grammarly
brew cask install postman
#brew cask install whatsapp
brew cask install zoom
brew cask install simplenote

cd $HOME/repos
git clone https://github.com/powerline/fonts.git --depth=1
./install.sh

echo 'All done. Switching to shell...'

# All done. Switch shell
# chsh -s /bin/zsh

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
