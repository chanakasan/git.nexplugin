source $(nex _config)
export nex_git_path=$(nex _plugin git)
export PATH=$nex_git_path/bin:$PATH

for f in $nex_git_path/src/bash/*.sh; do
  source $f
done
