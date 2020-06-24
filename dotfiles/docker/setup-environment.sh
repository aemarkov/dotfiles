#!/bin/sh

set -x
cd $HOME

# Install packages
sudo apt update
sudo apt install -y zsh curl wget ninja-build gettext libtool libtool-bin autoconf automake cmake g++ pkg-config unzip clangd-10

# Setup zsh and oh-my-zsh
chsh -s $(which zsh)
curl -sL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh | bash -s -- --unattended

# Install pip
# Pip have no sense in docker environment, but it is required to install some dependencies
cd /tmp
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
python get-pip.py
python3 get-pip.py

# Install dotfiles
curl -sL https://raw.githubusercontent.com/Garrus007/dotfiles/master/dotfiles/setup_dotfiles.sh | bash

# NeoVim
# Build and install NeoVim (build new version, it's cooler than from repo)
cd /tmp
wget https://github.com/neovim/neovim/archive/v0.4.3.tar.gz
tar -xvf v0.4.3.tar.gz
cd neovim-0.4.3
make CMAKE_BUILD_TYPE=RelWithDebInfo
make install
cd $HOME
sudo update-alternatives --install /usr/bin/vi vi $(which nvim) 100
sudo update-alternatives --install /usr/bin/vim vim $(which nvim) 100
sudo update-alternatives --install /usr/bin/editor editor $(which nvim) 100

# Install VimPlug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# Install nodejs required for coc.nvim
curl -sL install-node.now.sh/lts | bash -s -- -y

# Install clangd language server required by coc.nvim
sudo update-alternatives --install /usr/bin/clangd clangd $(which clangd-10) 100

# Install python modules for neovim
python -m pip install neovim
python3 -m pip install neovim

# Install coc extensions
# Note: I have list of extensions in Vim config, but they will be installed
# when vim will be started for the first time. It's not acceptable for Docker
# environment, so install all packages manually
COC_EXTENSIONS="coc-clangd coc-python coc-rust-analyzer coc-vimtex coc-json"
mkdir -p $HOME/.config/coc/extensions
cd $HOME/.config/coc/extensions
if [ ! -f package.json ]
then
  echo '{"dependencies":{}}'> package.json
fi
npm install $COC_EXTENSIONS --global-style --ignore-scripts --no-bin-links --no-package-lock --only=prod

# Install vim plugins
nvim --headless +PlugInstall +qall
