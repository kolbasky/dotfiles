#!/usr/bin/env bash

shopt -s extglob
export GLOBIGNORE=NULL
SRCDIR=`dirname $0`
EXCLUDE="$@"
EXCLUDE=".|..|.git|install.sh|${EXCLUDE// /\|}"

printf '\nCopying dotfiles and dotdirs...\n'
cp -arv --backup $SRCDIR/!($EXCLUDE) ~/

printf '\nInstalling fzf..'
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

printf '\nDownloading Vim Plug...\n'
curl -sfLo ~/.vim/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

printf '\nInstalling Vim plugins...\n'
vi +PlugInstall +qall

printf '\nCloning Tmux Plugin Manager...\n'
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

printf '\nIn tmux press Ctrl+B - I(capital) to install plugins.\n'

printf '\nAdding include of .bashrc.d/* to ~/.bashrc...\n'
if [[ `grep -c 'for file in ~/.bashrc.d/\*; do source $file; done' ~/.bashrc` -eq 0 ]]; then
  echo 'for file in ~/.bashrc.d/*; do source $file; done' >> ~/.bashrc
fi

printf '\nCreating vim backup directory...\n'
mkdir ~/.vim/tmp 2> /dev/null

tmux source ~/.tmux.conf
source ~/.bashrc

