underline_quine () {
  echo -e "\e[4m$@\e[0m"
  $@
}
header STATUS
  git status
header LOGHEAD
  git log -n 1
header IDENTITY & CREDENTIAL CONFIGS
  underline_quine git whoami
  underline_quine git config credential.helper
  underline_quine git config credential.useHttpPath
header ORIGIN
  git remote show origin | grep "URL\|up to date\|local out of date"
  git ls-remote #the point of this command is to show what the most recent commit is on the remote, but also log you in if you aren't already.
header "NO""CHECKINS"
  export LC_ALL=C #this is just a funny hack to get grep to go faster. I'm not sure it actually does anything for the git-internal grep.
  git "no""checkins"
echo
