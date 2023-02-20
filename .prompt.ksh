virtual_env() {
  if test -n "${VIRTUAL_ENV}"; then
    echo '\x1b[33m$(basename ${VIRTUAL_ENV})\x1b[00m '
  fi
}

user_name() {
  echo '$(whoami)\033[31m@\033[00m$(hostname) '
}

prompt_directory() {
  if test ${PWD} = ${HOME}; then
    printf '\033[34m~\033[00m '
  else
    printf "\033[34m$(pwd)\033[00m "
  fi
}

character() {
  status=$?
  if test status -eq 0; then
    echo '\033[32m>\033[00m '
  else
    echo '\033[31m>\033[00m '
  fi
}

root_character() {
  status=$?
  if test status -eq 0; then
    echo '\033[00m# '
  else
    echo '\033[31m#\033[00m '
  fi
}

user_prompt() {
  printf "$(printf "$(virtual_env)$(user_name)"'$(prompt_directory)$(character)')"
}

root_prompt() {
  printf "$(printf '$(prompt_directory)$(root_character)')"
}
