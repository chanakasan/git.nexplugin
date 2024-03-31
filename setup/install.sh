#!/usr/bin/env bash

set -e

source $nex_git_path/setup/lib.sh

main() {
  local start_text='__nex_git_start'
  local end_text='__nex_git_end'
  local bashrc="$HOME/.bashrc"
  start
  update_bashrc
  create_symlinks
  finish
}

start() {
  # validate_var_is_defined "start_text" $start_text
  # validate_var_is_defined "end_text" $end_text
  # validate_var_is_defined "bashrc" $bashrc
  echo " Installing - Nex Git"
}

finish() {
  echo " done"
  echo
}

update_bashrc() {
  remove_from_bashrc
  copy_to_bashrc
}

create_symlinks() {
  ln -nfs $nex_git_path/src/config/_gitconfig $HOME/.gitconfig
  ln -nfs $nex_git_path/src/config/_gitignore_global $HOME/.gitignore_global
}

remove_from_bashrc() {
  sed -i '/#'$start_text'/,/#'$end_text'/{d}' $bashrc
}

copy_to_bashrc() {
  echo "" >> $bashrc
  echo "#$start_text" >> $bashrc
  echo 'export nex_git_path='$nex_git_path >> $bashrc
  echo 'source $nex_git_path/bash/main.sh' >> $bashrc
  echo 'export PATH=$nex_git_path/bin:$PATH' >> $bashrc
  echo "#$end_text" >> $bashrc
  echo "" >> $bashrc
}

# _end_
main
