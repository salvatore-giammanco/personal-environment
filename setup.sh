#!/bin/bash

echo "Welcome to FirEc00l new MacOs setup wizard\n\n"

# Installing Homebrew
echo "Installing HomeBrew..."
if brew -v; then
    echo "✓ HomeBrew already installed"
else
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    echo "✓ HomeBrew Installed successfully"
    export PATH=/opt/homebrew/bin:$PATH
fi

# Install applications through homebrews
echo "Installing applications..."
brew install pyenv poetry bat git
echo "✓ Applications Installed"

# Install Oh My Zsh
echo "Installing Oh My Zsh..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
echo "✓ Oh My Zsh Installed"

# Install Zsh Plugins
echo "Installing Zsh Plugins..."
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions.git $HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions
echo "✓ Zsh Plugins Installed succcessfully"

# Install starship
echo "Installing Starship..."
curl -sS https://starship.rs/install.sh | sh
echo "✓ Starship Installed successfully"

# Pull .zshrc
echo "Pulling Zsh configuration..."
curl https://raw.githubusercontent.com/salvatore-giammanco/personal-environment/main/.zshrc > ~/.zshrc
echo "✓ Zsh configuration pulled successfully"

# Pull Iterm2 profile
# echo "Pulling Iterm2 profiles..."

# echo "✓ Iterm2 profiles pulled successfully"

# Install Rust
echo "Installing Rust..."
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
echo "✓ Rust Installed successfully"
source "$HOME/.cargo/env"

# Create Workspace directory
mkdir ~/Workspace

# Git configuration
git config --global user.name "Salvatore Giammanco"
git config --global user.email "salvatore@giammanco.me"