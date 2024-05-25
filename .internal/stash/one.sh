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
