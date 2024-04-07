#!/bin/bash

set -e

source $(dirname "$0")/config.sh
source $nex_support_path/src/plugin/install/helpers.sh

main() {
  start
  validate
  remove_from_bashrc
  copy_to_bashrc
  create_symlinks
  finish
}

create_symlinks() {
  ln -nfs $nex_git_path/src/config/_gitconfig $HOME/.gitconfig
  ln -nfs $nex_git_path/src/config/_gitignore_global $HOME/.gitignore_global
}

main
