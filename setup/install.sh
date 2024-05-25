create_symlinks() {
  local root=$(nex _plugin git)
  local base=$root/src/config
  ln -nfs $base/_gitconfig $HOME/.gitconfig
  ln -nfs $base/_gitignore_global $HOME/.gitignore_global
}

create_symlinks
