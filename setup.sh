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
brew install git htop mysql python selenium-server-standalone elasticsearch ghostscript libtiff exiftool MP4Box ufraw dcraw redis memcached tomcat-native
brew install imagemagick@6
brew install ffmpeg --with-libvorbis --with-libvpx --use-gcc  --with-libx264 --with-flac --with-theorao
# brew tap homebrew/cask-cask
brew install homebrew/cask-versions/java11
brew tap mongodb/brew
brew install mongodb-community@4.2
brew install fzy
brew install mas
brew install mackup

# Install NVM
echo 'Installing NVM...'
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash

echo 'Installing Node...'
nvm install 12

# Installing ZSH
# echo 'Installing ZSH Shell...'
#sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

#brew install zsh-autosuggestions

#Install fish
echo 'Installing FISH Shell...'
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
brew cask install alfred
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
# brew cask install the-clock
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
brew cask install dash4
brew cask install expressvpn
#brew cask install focusatwill
brew cask install grammarly
brew cask install postman
#brew cask install whatsapp
brew cask install zoomus
brew cask install simplenote


echo 'Install apps from the App Store...'
# Trello
mas install 1278508951
# Todoist
mas install 585829637
# The Clock 
mas install 488764545
# Word
mas install 462054704
# Excel
mas install 462058435
# Powerpoint
mas install 462062816
# Pages
mas install 409201541
# Keynote
mas install 409183694
# Numbers
mas install 409203825

# Powerline Fonts
cd $HOME/repos
git clone https://github.com/powerline/fonts.git --depth=1
./install.sh


# All done. Switch shell
# chsh -s /bin/zsh

# Need to append fish shell to default shells
sudo sh -c 'echo "/usr/local/bin/fish" >> /etc/shells'

linuxstuff="$HOME/repos/linux-stuff"
if [[ -d "$linuxstuff" ]]; then
  mkdir -p "$HOME/.ssh"
  link "$linuxstuff/id_rsa" "$HOME/.ssh/id_rsa"
  link "$linuxstuff/id_rsa.pub" "$HOME/.ssh/id_rsa.pub"
  link "$linuxstuff/macos_config.fish" "$HOME/.config/fish/config.fish"
fi

oned="$HOME/OneDrive"
if [[ -d "$oned" ]]; then
  sudo rm -rf "$HOME/Documents"
  sudo rm -rf "$HOME/Downloads"
  sudo rm -rf "$HOME/Pictures/Snagit"
  sudo rm -rf "$HOME/Pictures/Wallpaper"
  sudo rm -rf "$HOME/Pictures/Camera Roll"
  ln -s "$oned/macOS/Documents" "$HOME/Documents"
  ln -s "$oned/Downloads" "$HOME/Downloads"
  ln -s "$oned/Pictures/Snagit" "$HOME/Pictures/Snagit"
  ln -s "$oned/Pictures/Wallpaper" "$HOME/Pictures/Wallpaper"
  ln -s "$oned/Pictures/Camera Roll" "$HOME/Pictures/Camera Roll"
  # Mackup
  cp -pr "$oned/Mackup/.mackup.cfg" "$HOME/."
fi

# All done. Switch shell
echo 'Switching default shell to Fish...'
chsh -s /usr/local/bin/fish

echo 'Installing Fish stuff...'

fish <<'END_FISH'
  # oh-my-fish
  curl -L https://get.oh-my.fish | fish
  # enhancd
  omf install https://github.com/b4b4r07/enhancd
  # Bobthefish
  omf install bobthefish
  # Bass
  omf install bass
END_FISH

echo '============================================='
echo 'Script is done. Keep on :)'
echo '============================================='

# Function that does the symbolic links
link() {
  from="$1"
  to="$2"
  echo "Linking '$from' to '$to'"
  rm -rf "$to"
  ln -s "$from" "$to"
}
