create_symlinks() {
  echo " Installing - git.plugin"
  local root=$(nex _plugin git)
  local base=$root/src/config
  ln -nfs $base/_gitconfig $HOME/.gitconfig
  ln -nfs $base/_gitignore_global $HOME/.gitignore_global
  echo " symlinked .gitconfig, .gitignore_global"
  echo
}

create_symlinks
