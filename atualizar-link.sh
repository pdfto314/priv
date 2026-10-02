#!/usr/bin/env bash
# Atualiza o link do túnel e publica no GitHub Pages.
#   ./atualizar-link.sh https://xxxx.trycloudflare.com   -> novo link
#   ./atualizar-link.sh off                              -> mostra "IA offline"
set -euo pipefail

link="${1:?Uso: $0 <url-do-tunel | off>}"
cd "$(dirname "$0")"

if [[ "$link" == "off" ]]; then
  link=""
elif [[ ! "$link" =~ ^https:// ]]; then
  echo "O link precisa começar com https://" >&2
  exit 1
fi

printf '%s\n' "$link" > ia/link.txt
git add ia/link.txt
git commit -m "update tunnel link"
git push
