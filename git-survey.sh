underline_quine () {
  echo -e "\e[4m$@\e[0m"
  $@
}
echo -e "\e[7m[STATUS]\e[0m"
  git status
echo
echo -e "\e[7m[LOGHEAD]\e[0m"
  git log -n 1
echo
echo -e "\e[7m[IDENTITY & CREDENTIAL CONFIGS]\e[0m"
  underline_quine git whoami
  underline_quine git config credential.helper
  underline_quine git config credential.useHttpPath
echo
echo -e "\e[7m[ORIGIN]\e[0m"
  git remote show origin | grep "URL\|up to date\|local out of date"
  git ls-remote #the point of this command is to show what the most recent commit is on the remote, but also log you in if you aren't already.
echo
echo -e "\e[7m[NO""CHECKINS]\e[0m"
  export LC_ALL=C #this is just a funny hack to get grep to go faster. I'm not sure it actually does anything for the git-internal grep.
  git "no""checkins"
echo
