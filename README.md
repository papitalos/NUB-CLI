# 🚀 No Unnecessary Burden (NUB)

**A personal CLI designed to make life easier by automating the creation of projects that usually require multiple manual terminal commands.**

---

## 🔍 Check your shell and configure NUB-CLI

To get started, let's identify which shell you are using (bash or zsh) and configure the environment correctly.

---

### 1️⃣ Detect your shell by running this command in the terminal:

```bash
echo $SHELL
```

---

### 2️⃣ Depending on the result, copy and paste the appropriate command in your terminal:

### For `/bin/bash` users:
If you are using Bash, copy and paste the following commands in your terminal:
```bash
git clone https://github.com/papitalos/NUB-CLI.git ~/NUB-CLI
echo 'export PATH="$HOME/NUB-CLI/bin:$PATH"' >> ~/.bashrc
source ~/.bashrc
```

### For `/bin/zsh` users:
If you are using Zsh, copy and paste the following commands in your terminal:
```zsh
git clone https://github.com/papitalos/NUB-CLI.git ~/NUB-CLI
echo 'export PATH="$HOME/NUB-CLI/bin:$PATH"' >> ~/.zshrc
source ~/.zshrc
```

---

### 3️⃣ Done! Now you can use the `nub` command in your terminal.

---

## 📦 Currently Supported Project Types

NUB supports the automatic creation of the following types of projects:

- 🐍 **Python**  
  - Basic Python project with a configured `.venv` virtual environment.  
  - Command:  
    ```bash
    nub py create <project-name> [--with-git]
    ```

- 🕹️ **glcore** (OpenGL C++ Project)  
  - C++ project using GLFW + GLM + OpenGL configured with CMake.  
  - Command:  
    ```bash
    nub gl create <project-name> [--with-git]
    ```

---

## 🎯 Next Steps

- Explore the `nub start` command to launch the current project  
- Use `nub deploy` (available in the development environment) to update versions

---

## 📚 Documentation and Help

To see the full list of commands and help, run:

```bash
nub help
```
Made with ❤️ by Italo Teofilo

