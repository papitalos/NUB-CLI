#!/bin/bash

ACTION=$1
NAME=$2

NUB_ROOT="$HOME/Documents/dev/personal/nub-local"
TEMPLATE_DIR="$NUB_ROOT/templates/glcore"

if [ "$ACTION" = "create" ]; then
  if [ -z "$NAME" ]; then
    echo "Você precisa fornecer um nome para o projeto."
    exit 1
  fi

  PROJECT_PATH="$(pwd)/$NAME"

  mkdir -p "$PROJECT_PATH/src" "$PROJECT_PATH/include" "$PROJECT_PATH/build" "$PROJECT_PATH/.vscode"

  # Copiar arquivos do template
  cp -r "$TEMPLATE_DIR/src" "$PROJECT_PATH/"
  cp "$TEMPLATE_DIR/README.md" "$PROJECT_PATH/"

  # Substituir nome do projeto no README
  sed -i '' "s/NOME_DO_PROJETO/$NAME/g" "$PROJECT_PATH/README.md"

  # Criar CMakeLists.txt
  cat <<EOF > "$PROJECT_PATH/CMakeLists.txt"
cmake_minimum_required(VERSION 3.0)
project($NAME)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY \${CMAKE_BINARY_DIR}/bin)

find_package(OpenGL REQUIRED)
find_package(GLEW REQUIRED)
find_package(glfw3 REQUIRED)

include_directories(\${OPENGL_INCLUDE_DIRS} \${GLEW_INCLUDE_DIRS})
link_directories(\${GLEW_LIBRARY_DIRS})

add_executable(\${PROJECT_NAME} src/main.cpp)

target_link_libraries(\${PROJECT_NAME}
    \${OPENGL_LIBRARIES}
    GLEW::GLEW
    glfw
)
EOF

  # .gitignore
  cat <<EOF > "$PROJECT_PATH/.gitignore"
/build/
/.vscode/
/idea/
*.o
*.out
*.exe
EOF

  # tasks.json
  cat <<EOF > "$PROJECT_PATH/.vscode/tasks.json"
{
  "version": "2.0.0",
  "tasks": [
    {
      "label": "CMake Build",
      "type": "shell",
      "command": "cmake -S . -B build && cmake --build build",
      "group": "build"
    },
    {
      "label": "Run Executável",
      "type": "shell",
      "command": "./build/bin/$NAME",
      "group": "test",
      "dependsOn": "CMake Build",
      "problemMatcher": []
    }
  ]
}
EOF

  echo "$PROJECT_PATH"
else
  echo "Ação desconhecida: $ACTION"
  exit 1
fi
