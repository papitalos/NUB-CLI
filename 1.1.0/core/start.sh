#!/bin/bash

PROJECT_PATH=$(pwd)
PROJECT_NAME="$(basename "$PROJECT_PATH")"

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
    BIN="./build/bin/$PROJECT_NAME"

    echo "Procurando Build para $BIN"
    
     if [ ! -f "$BIN" ]; then
        mkdir -p build
        cd build || exit 1
        cmake ..
        cmake --build .
        cd ..
    fi


    if [ -f "$BIN" ]; then
        echo "🚀 Executando $BIN"
        "$BIN"
    else
        echo "❌ Compilação falhou ou executável não encontrado."
    fi
    
  exit 0
fi

echo "❌ Tipo de projeto desconhecido"
