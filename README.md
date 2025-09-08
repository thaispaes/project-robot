# 🤖 Projeto de Automação Backend e Web
## ViaCEP - API e Kabum - Web

<p align="center">
  <img
    src="https://img.shields.io/badge/Status-Concluido-green?style=flat-square"
    alt="Status"
  />
</p>

<p align="center">
  <img
    src="https://img.shields.io/github/repo-size/Thomazrlima/README.md-Templates?style=flat"
    alt="Repository Size"
  />
  <img
    src="https://img.shields.io/github/commit-activity/t/Thomazrlima/README.md-Templates?style=flat&logo=github"
    alt="Commit Activity"
  />
  <a href="LICENSE.md"
    ><img
      src="https://img.shields.io/github/license/Thomazrlima/README.md-Templates"
      alt="License"
  /></a>
</p>


## 🚀 Sobre o projeto

O projeto tem como intuito automatizar dois fluxos distintos, tanto teste Web como teste de API, o fluxo da aplicação Web e da compra de um produto no site da <a href="http://kabum.com.br/">Kabum</a> e o fluxo de API e validar as requisicoes para a API <a href="viacep.com.br">ViaCEP</a> onde pudemos validar varios cenarios como CEP Invalido, Inexistente e ate valido. 

- Fluxo detalhado WEB 
🔗 Acesso a página
🔎 Buscar pelo Produto  
📌 Validar produto selecionado 
🛒 Adicionar ao carrinho
✔️ Validar produto adicionado

- Fluxo detalhado API
✔️ CEP válido
❌ CEP inválido (CEP que não existe)
❌ CEP Incorreto (Maior que oito, menor que oito, espaços,)
❌ CEP com Caracter especial e Letras


## 🔧 Como usar

- Ter o Python 3.13.2 :snake: instalado na sua maquina
- IDE da sua escolha mas recomendamos o VSCode
- Instalar a extensão do VSCode RobotCode
- Criar um ambiente venv e instalar dependências 
    ```python -m venv venv
    venv/Scripts/activate```
- Rodar no terminal o <code>pip install -r requirements.txt</code> que vai instalar todas as dependências

## 🖥️ Tecnologias implementadas

- Robot Framework
- Selenium WebDriver
- Requests Library
- JSON Library
- Python (para geração de evidências em PDF)

A estruturação do projeto segue o padrão de "page objects" e os test cases foram escritos seguindo o Gherkin e nomenclaturas do robot


## ⚖️ License

[MIT]