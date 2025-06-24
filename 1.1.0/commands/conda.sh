#!/bin/bash

ACTION=$1
ENV_NAME=$2

if [ "$ACTION" != "create" ]; then
  echo "❌ Ação desconhecida: $ACTION"
  echo "Use: nub conda create <nome-do-ambiente>"
  exit 1
fi

if [ -z "$ENV_NAME" ]; then
  echo "❌ Você precisa fornecer um nome para o ambiente."
  exit 1
fi

# Verifica se o conda está instalado
if ! command -v conda &> /dev/null; then
  echo "❌ Conda não encontrado. Verifique se o Anaconda está instalado e disponível no PATH."
  exit 1
fi

echo "🚀 Criando ambiente Conda chamado '$ENV_NAME' com pacotes científicos essenciais..."

# Cria o ambiente com Python 3.11 (ajuste se quiser outra versão)
conda create -n "$ENV_NAME" python=3.11 -y

# Ativa o ambiente temporariamente em subshell e instala pacotes
source "$(conda info --base)/etc/profile.d/conda.sh"
conda activate "$ENV_NAME"

# Instala pacotes científicos essenciais
conda install -y numpy pandas scipy matplotlib scikit-learn jupyter seaborn ipython

# Obtém o caminho do interpretador
PYTHON_PATH=$(which python)

echo ""
echo "✅ Ambiente '$ENV_NAME' criado com sucesso!"
echo "📍 Caminho do interpretador: $PYTHON_PATH"

# Retorna caminho do python (importante para integração com o NUB principal se desejar)
echo "$PYTHON_PATH"
