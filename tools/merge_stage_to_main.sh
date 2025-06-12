#!/bin/bash

current_branch=$(git branch --show-current)
if [ "$current_branch" != "stage" ]; then
  echo "Você não está na branch 'stage'. Mude para ela antes de rodar o script."

  exit 1
fi

git status

git fetch origin

commits=$(git log main..stage --oneline)

if [ -z "$commits" ]; then
  echo "A branch 'stage' já está contida em 'main'. Nada a fazer."

else
  git checkout main || { echo "Falha ao mudar para 'main'"; exit 1; }

  git merge stage --no-edit || { echo "Conflito no merge. Resolva manualmente."; exit 1; }
  
  git push origin main
fi

git checkout stage
