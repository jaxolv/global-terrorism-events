#!/bin/bash

current_branch=$(git branch --show-current)
if [ "$current_branch" != "main" ]; then
  git checkout main || { echo "Falha ao mudar para a branch 'main'. Mude manualmente."; exit 1; }

  exit 1
fi

branches=("stage" "sql" "scripts" "dashboards")

for branch in "${branches[@]}"
do
    git checkout $branch || { echo "Falha ao mudar para $branch. Continue com o procedimento manualmente."; exit 1; }

    git merge main --no-edit || { echo "Conflito ao fazer merge em $branch. Resolva manualmente."; exit 1; }

    git push origin $branch || { echo "Push falhou para $branch"; exit 1; }
done

git checkout main
