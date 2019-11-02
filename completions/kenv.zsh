if [[ ! -o interactive ]]; then
    return
fi

compctl -K _kenv kenv

_kenv() {
  local words completions
  read -cA words

  if [ "${#words}" -eq 2 ]; then
    completions="$(kenv commands)"
  else
    completions="$(kenv completions ${words[2,-1]})"
  fi

  reply=("${(ps:\n:)completions}")
}
