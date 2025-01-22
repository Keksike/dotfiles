# dotfiles

### Install

- [iterm](https://github.com/gnachman/iTerm2)
- [homebrew](https://brew.sh/)
- [oh-my-zsh](https://ohmyz.sh/#install)

### 🍺

```sh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
brew instal ripgrep
brew tap homebrew/cask-fonts
brew install --cask iterm2
brew install --cask cursor
```

### Symlinks

```sh
ln -s ~/Projects/dotfiles/.zshrc ~/.zshrc
ln -s ~/Projects/dotfiles/.gitconfig ~/.gitconfig
ln -s ~/Projects/dotfiles/.gitignore ~/.gitignore
```

### Useful

```bash
# Hide the dock
osascript -e 'tell application "System Events" to set the autohide of the dock preferences to true'
defaults write com.apple.dock orientation -string right
defaults write com.apple.Dock autohide-delay -int 999999
killall Dock
```
