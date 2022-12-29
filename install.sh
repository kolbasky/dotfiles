#!/usr/bin/env bash

shopt -s extglob
export GLOBIGNORE=NULL
SRCDIR=`dirname $0`
EXCLUDE="$@"
EXCLUDE=".git|install.sh|${EXCLUDE// /\|}"

printf '\nCopying dotfiles and dotdirs...\n'
cp -iarv $SRCDIR/!($EXCLUDE) ~/

printf '\nCloning Vim Plug...\n'
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

printf '\nInstalling Vim plugins...\n'
vi +PlugInstall +qall

printf '\nCloning Tmux Plugin Manager - TPM...\n'
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

printf '\nIn tmux press Ctrl+B - I(capital) to install plugins.\n'

printf '\nAdding include of .bashrc.d/* to ~/.bashrc...\n'
if [[ `grep -c 'for file in ~/.bashrc.d/\*; do source $file; done' ~/.bashrc` -eq 0 ]]; then
  echo 'for file in ~/.bashrc.d/*; do source $file; done' >> ~/.bashrc
fi

tmux source ~/.tmux.conf
source ~/.bashrc

