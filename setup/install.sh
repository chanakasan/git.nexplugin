#!/usr/bin/env bash

set -e

main() {
  local start_text='__nex_git_start'
  local end_text='__nex_git_end'
  local bashrc="$HOME/.bashrc"
  local nex_git_path=$(get_root_path)/nex-git
  echo " Installing - Nex Git"
  remove_from_bashrc
  copy_to_bashrc
  create_symlinks
  echo ""
  echo " done"
  echo ""
}

create_symlinks() {
  ln -nfs $nex_git_path/config/_gitconfig $HOME/.gitconfig
  ln -nfs $nex_git_path/config/_gitignore_global $HOME/.gitignore_global
}

get_root_path() {
  local user=$(whoami)
  if [ "$user" = "codespace" ]; then
    echo /workspaces/.codespaces/.persistedshare
  else
    echo $HOME/dotfiles
  fi
}

remove_from_bashrc() {
  sed -i '/#'$start_text'/,/#'$end_text'/{d}' $bashrc
}

copy_to_bashrc() {
  echo "" >> $bashrc
  echo "#$start_text" >> $bashrc
  echo 'export nex_git_path='$nex_git_path >> $bashrc
  # echo 'source $nex_git_path/bash/main.sh' >> $bashrc
  echo 'export PATH=$nex_git_path/bin:$PATH' >> $bashrc
  echo "#$end_text" >> $bashrc
  echo "" >> $bashrc
}

# _end_
main
