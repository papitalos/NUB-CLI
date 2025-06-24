#include <GL/glew.h>
#include <GLFW/glfw3.h>
#include <iostream>
#include <cmath>

float angle = 0.0f;

void initGL() {
    std::cout << "Inicializando OpenGL..." << std::endl;
    glEnable(GL_DEPTH_TEST);
    glClearColor(0.1f, 0.1f, 0.1f, 1.0f); // Fundo cinza escuro para contraste
    
    // Configurações básicas do OpenGL
    glShadeModel(GL_SMOOTH);
    glEnable(GL_COLOR_MATERIAL);
    
    std::cout << "OpenGL inicializado com sucesso!" << std::endl;
}

void setupProjection(int width, int height) {
    if (height == 0) height = 1; // Evitar divisão por zero
    
    glViewport(0, 0, width, height);
    glMatrixMode(GL_PROJECTION);
    glLoadIdentity();
    
    // Usando glFrustum para criar a projeção perspectiva
    float aspect = (float)width / (float)height;
    float fH = tan(45.0f / 360.0f * M_PI) * 0.1f;
    float fW = fH * aspect;
    glFrustum(-fW, fW, -fH, fH, 0.1f, 100.0f);
    
    glMatrixMode(GL_MODELVIEW);
}

// Callback para redimensionamento da janela
void framebufferSizeCallback(GLFWwindow* window, int width, int height) {
    setupProjection(width, height);
}

void drawCube() {
    glBegin(GL_QUADS);

    // Frente (vermelho)
    glColor3f(1.0f, 0.0f, 0.0f);
    glVertex3f(-1, -1,  1);
    glVertex3f( 1, -1,  1);
    glVertex3f( 1,  1,  1);
    glVertex3f(-1,  1,  1);

    // Trás (verde)
    glColor3f(0.0f, 1.0f, 0.0f);
    glVertex3f(-1, -1, -1);
    glVertex3f(-1,  1, -1);
    glVertex3f( 1,  1, -1);
    glVertex3f( 1, -1, -1);

    // Esquerda (azul)
    glColor3f(0.0f, 0.0f, 1.0f);
    glVertex3f(-1, -1, -1);
    glVertex3f(-1, -1,  1);
    glVertex3f(-1,  1,  1);
    glVertex3f(-1,  1, -1);

    // Direita (amarelo)
    glColor3f(1.0f, 1.0f, 0.0f);
    glVertex3f(1, -1, -1);
    glVertex3f(1,  1, -1);
    glVertex3f(1,  1,  1);
    glVertex3f(1, -1,  1);

    // Topo (ciano)
    glColor3f(0.0f, 1.0f, 1.0f);
    glVertex3f(-1, 1, -1);
    glVertex3f(-1, 1,  1);
    glVertex3f( 1, 1,  1);
    glVertex3f( 1, 1, -1);

    // Base (magenta)
    glColor3f(1.0f, 0.0f, 1.0f);
    glVertex3f(-1, -1, -1);
    glVertex3f( 1, -1, -1);
    glVertex3f( 1, -1,  1);
    glVertex3f(-1, -1,  1);

    glEnd();
}

int main() {
    std::cout << "Iniciando aplicação..." << std::endl;
    
    if (!glfwInit()) {
        std::cerr << "Erro ao iniciar GLFW\n";
        return -1;
    }
    std::cout << "GLFW inicializado com sucesso!" << std::endl;

    // Solicitar contexto OpenGL compatível
    glfwWindowHint(GLFW_CONTEXT_VERSION_MAJOR, 2);
    glfwWindowHint(GLFW_CONTEXT_VERSION_MINOR, 1);

    GLFWwindow* window = glfwCreateWindow(800, 600, "Cubo Girando", nullptr, nullptr);
    if (!window) {
        std::cerr << "Erro ao criar janela\n";
        glfwTerminate();
        return -1;
    }
    std::cout << "Janela criada com sucesso!" << std::endl;

    glfwMakeContextCurrent(window);
    std::cout << "Contexto OpenGL ativado!" << std::endl;
    
    // Configurar callback de redimensionamento
    glfwSetFramebufferSizeCallback(window, framebufferSizeCallback);
    
    // Configurar VSync
    glfwSwapInterval(1);
    
    glewExperimental = GL_TRUE;
    GLenum err = glewInit();
    if (err != GLEW_OK) {
        std::cerr << "Erro ao inicializar GLEW: " << glewGetErrorString(err) << std::endl;
        glfwDestroyWindow(window);
        glfwTerminate();
        return -1;
    }
    std::cout << "GLEW inicializado com sucesso!" << std::endl;

    // Verificar versão do OpenGL
    std::cout << "OpenGL Version: " << glGetString(GL_VERSION) << std::endl;

    initGL();
    
    // Configurar projeção inicial
    int width, height;
    glfwGetFramebufferSize(window, &width, &height);
    setupProjection(width, height);

    std::cout << "Entrando no loop principal..." << std::endl;
    while (!glfwWindowShouldClose(window)) {
        glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);

        glLoadIdentity();
        glTranslatef(0.0f, 0.0f, -5.0f);
        glRotatef(angle, 1.0f, 1.0f, 0.0f);
        
        drawCube();

        angle += 1.0f;
        if (angle > 360.0f) angle -= 360.0f;

        glfwSwapBuffers(window);
        glfwPollEvents();

        if (glfwGetKey(window, GLFW_KEY_ESCAPE) == GLFW_PRESS)
            glfwSetWindowShouldClose(window, true);
    }

    std::cout << "Finalizando aplicação..." << std::endl;
    glfwDestroyWindow(window);
    glfwTerminate();
    return 0;
}
