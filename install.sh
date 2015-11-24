#!/usr/bin/env bash

# Install vim plugins
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim +PlugInstall +qall
ln -s vimrc ~/.vimrc

# Spacemacs
git clone --recursive http://github.com/syl20bnr/spacemacs ~/.emacs.d
ln -s spacemacs ~/.spacemacs

# Prezto
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
zsh -s <<EOF
setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done
EOF

rm -rf ~/.zprezto/modules/prompt/functions/prompt_pure_setup
ln -s prompt/prompt_pure_setup ~/.zprezto/modules/prompt/functions/prompt_pure_setup