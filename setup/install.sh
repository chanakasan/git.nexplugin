source $(nex _config)
bash $nex_support/plugin/install/run_default.sh "git"

steps() {
  create_symlinks
}

create_symlinks() {
  local tmp_base=$nex_plugin_base/git.plugin/src/config
  ln -nfs $tmp_base/_gitconfig $HOME/.gitconfig
  ln -nfs $tmp_base/_gitignore_global $HOME/.gitignore_global
}

steps
