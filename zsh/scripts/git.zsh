# All helper for Git

# Go to the root of a project (git root)
root() {
  cd $(git rev-parse --show-toplevel)
}

unalias gcob
gcob() {
  _fzf_git_branches --no-multi | xargs git checkout
}
