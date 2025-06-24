#!/bin/bash

ACTION=$1
NAME=$2

NUB_ROOT="$HOME/Documents/dev/personal/nub-local"
TEMPLATE_DIR="$NUB_ROOT/templates/python"

if [ "$ACTION" = "create" ]; then
  if [ -z "$NAME" ]; then
    echo "Você precisa fornecer um nome para o projeto."
    exit 1
  fi

  mkdir "$NAME"
  cd "$NAME"

  # Cria e ativa o venv
  python3 -m venv .venv
  source .venv/bin/activate

  # Copia templates
  cp "$TEMPLATE_DIR/main.py" .
  cp "$TEMPLATE_DIR/README.md" .

  # Substitui o nome do projeto no README.md
  sed -i '' "s/^# Projeto Python:.*/# Projeto Python: $NAME/" README.md

  echo ".venv/" > .gitignore

  echo "Projeto Python '$NAME' criado com sucesso com template inicial."
else
  echo "Ação desconhecida: $ACTION"
fi
