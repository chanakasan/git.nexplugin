#!/usr/bin/env bash

set -e

main() {
  local start_text='__nex_git_start'
  local end_text='__nex_git_end'
  local bashrc="$HOME/.bashrc"
  local nex_git_path=$(get_nex_root_path)/nex-git
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

get_nex_root_path() {
  local user=$(whoami)
  if [ "$user" = "codespace" ]; then
    echo /workspaces/.codespaces/.persistedshare
  else
    echo $HOME/dotfiles
  fi
}

# eg: validate_var_is_defined "start_text" $start_text
validate_var_is_defined() {
  local var_name="$1"
  local var_value="$2"
  if [ -n "${var_value}" ]; then
    :
  else
      echo "$var_name is required"
      exit 1
  fi
}

# _end_
main
