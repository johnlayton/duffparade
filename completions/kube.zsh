if [[ ! -o interactive ]]; then
    return
fi

compctl -K _kube kube

_kube() {
  local words completions
  read -cA words

  if [ "${#words}" -eq 2 ]; then
    completions="$(kube commands)"
  else
    completions="$(kube completions ${words[2,-1]})"
  fi

  reply=("${(ps:\n:)completions}")
}
