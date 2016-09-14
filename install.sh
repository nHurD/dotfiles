#!/usr/bin/env bash

# Emacs configuration
mkdir -p ~/.emacs.d
ln -s emacs.d/init.el ~/.emacs.d/init.el
ln -s emacs.d/jrsteele.org ~/.emacs.d/jrsteele.org

# Tmux
ln -s tmux.conf ~/.tmux.conf

# Install vim plugins
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim +PlugInstall +qall
ln -s vimrc ~/.vimrc


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
