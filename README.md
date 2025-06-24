# 🚀 No Unnecessary Burden (NUB)

**A personal CLI designed to make life easier by automating the creation of projects that usually require multiple manual terminal commands.**

---

## 🔍 Check your shell and configure NUB-CLI

Para começar, vamos identificar qual shell você está usando (bash ou zsh) e configurar o ambiente corretamente.

---

### 1️⃣ Detecte seu shell executando este comando no terminal:

```bash
echo $SHELL
```

---

### 2️⃣ Dependendo do resultado, copie e cole o comando adequado no seu terminal:

| Shell Detectado | Comando para clonar e configurar NUB-CLI                                  |
|-----------------|---------------------------------------------------------------------------|
| `/bin/bash`     | ```bash                                                                   
git clone https://github.com/papitalos/NUB-CLI.git ~/NUB-CLI
echo 'export PATH="$HOME/NUB-CLI/bin:$PATH"' >> ~/.bashrc
source ~/.bashrc
```                                                                         |
| `/bin/zsh`      | ```zsh                                                                    
git clone https://github.com/papitalos/NUB-CLI.git ~/NUB-CLI
echo 'export PATH="$HOME/NUB-CLI/bin:$PATH"' >> ~/.zshrc
source ~/.zshrc
```                                                                         |

---

### 3️⃣ Pronto! Agora você pode usar o comando `nub` no seu terminal.

---

## 📦 Projetos suportados atualmente

O NUB suporta a criação automática dos seguintes tipos de projeto:

- 🐍 **Python**  
  - Projeto básico Python com ambiente virtual `.venv` configurado.  
  - Comando:  
    ```bash
    nub py create <nome-do-projeto> [--with-git]
    ```

- 🕹️ **glcore** (OpenGL C++ Project)  
  - Projeto C++ usando GLFW + GLM + OpenGL configurado com CMake.  
  - Comando:  
    ```bash
    nub gl create <nome-do-projeto> [--with-git]
    ```

---

## 🎯 Próximos passos

- Explorar os comandos `nub start` para iniciar o projeto atual  
- Usar `nub deploy` (disponível no ambiente de desenvolvimento) para atualizar versões

---

## 📚 Documentação e ajuda

Para ver a lista completa de comandos e ajuda, execute:

```bash
nub help
```

---

**Made with ❤️ by Italo Teofilo**

---
