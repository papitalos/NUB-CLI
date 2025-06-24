#!/bin/bash

PROJECT_DIR=$1
cd "$PROJECT_DIR" || exit 1

echo "🔧 Inicializando repositório Git..."

git init &>/dev/null

# Gitignore dinâmico
touch .gitignore

if [ -d ".venv" ]; then
  echo ".venv/" >> .gitignore
fi

if [ -d "node_modules" ]; then
  echo "node_modules/" >> .gitignore
fi

if [ -d "conda" ]; then
  echo "conda/" >> .gitignore
fi

# Outros padrões (personalize aqui)
echo ".DS_Store" >> .gitignore

# Primeiro commit
git add .
git commit -m "init commit - with nub default template" &>/dev/null

echo "✅ Repositório Git iniciado com .gitignore"
