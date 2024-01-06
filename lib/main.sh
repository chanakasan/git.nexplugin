# vim:ft=sh:

g-help() {
  echo '+==========+'
  echo '| mod_git  |'
  echo '+==========+'
}

# long aliases
alias clone="git clone"
alias remote="git remote"
alias push="git push"
alias pull="git pull"
alias branch="git branch"

# shorthands
alias gco="git checkout"
alias gd="git diff"
alias gr="git reset"
alias gc="git commit"
alias ga="git add"
alias glg="git log --all --graph --oneline --decorate"
alias gir="_g-ir"

g() {
  local a1="$1"
  local a2="$2"
  local fn=g-$a1
  if [ -z "$a1" ]; then
    git status
  elif [[ $(type -t $fn ) == function ]]; then
    $fn "${@:2}"
  else
    git "$@"
  fi
}

g-po() {
  if [ -z "$1" ]; then
    echo "Usage: g po <branch>"
  else
    git push origin "$1"
  fi
}

g-ir() {
  local v="$1"
  local is_num=$(_nx_is_number $v)
  if [ -z "$v" ]; then
    git rebase -i HEAD~10
  elif [ "$is_num" = "true" ]; then
    git rebase -i HEAD~$1
  elif [ "$v" = "root" ]; then
    git rebase -i --root
  elif [ "$v" = "con" ]; then
    git rebase --continue
  elif [ "$v" = "abort" ]; then
    git rebase --abort
  else
    echo "arg must be an number"
  fi
}

g-add() {
  local v="$1"
  if [ -z "$v" ]; then
    git add --update .
  elif [ "$v" = "all" ]; then
    git add --all
  else
    git add "$@"
  fi
}

g-amend() {
  git commit -v --amend "$@"
}

g-show() {
  git show "$@"
}

# commit start
g-wip() {
  git commit -m "WIP" "$@"
}

g-rev() {
  git commit -m "rev" "$@"
}

g-first() {
  git commit -m "first" "$@"
}
# commit start

g-rl() {
  git reset HEAD~1
}

g-co() {
  git checkout "$@"
}

gl() {
  local v="$1"
  local is_num=$(_nx_is_number $v)
  if [ -z "$v" ]; then
    git log -5
  elif [ "$is_num" = "true" ]; then
    git log -$v
  else
    git log "$@"
  fi
}

g-dc() {
  git diff --cached "$@"
}

g-count() {
  git rev-list HEAD --count
}

g-tag() {
  git tag -a -m "$@"
}

g-cherry() {
  git cherry-pick "$@"
}

g-init() {
  git init "$@"
}

g-pom() {
  git push origin main "$@"
}

g-branch() {
  git symbolic-ref --short HEAD
}

g-example() {
  local v="$1"
  if [ -z "$v" ]; then
    git add --update .
  elif [ "$v" = "all" ]; then
    git add --all
  else
    git add "$@"
  fi
}

