#!/bin/bash

PROJECT_PATH=$(pwd)

if [ -f "main.py" ]; then
  echo "🔧 Projeto Python detectado"
  if [ -f ".venv/bin/activate" ]; then
    source .venv/bin/activate
  fi
  python3 main.py
  exit 0
fi

if [ -f "CMakeLists.txt" ] && [ -d "src" ]; then
  echo "🔧 Projeto glcore (C++) detectado"

  mkdir -p build
  cd build || exit 1
  cmake ..
  cmake --build .
  BIN="./bin/$(basename $(dirname $PROJECT_PATH))"
  if [ -f "$BIN" ]; then
    echo "🚀 Executando $BIN"
    "$BIN"
  else
    echo "❌ Compilação falhou ou executável não encontrado."
  fi
  exit 0
fi

echo "❌ Tipo de projeto desconhecido"
