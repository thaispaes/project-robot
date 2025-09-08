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

- Fluxo detalhado WEB <br>
🔗 Acesso a página <br>
🔎 Buscar pelo Produto <br> 
📌 Validar produto selecionado <br> 
🛒 Adicionar ao carrinho <br> 
✔️ Validar produto adicionado <br>

- Fluxo detalhado API <br>
✔️ CEP válido <br>
❌ CEP inválido (CEP que não existe) <br>
❌ CEP Incorreto (Maior que oito, menor que oito, espaços,) <br>
❌ CEP com Caracter especial e Letras <br>


## 🔧 Como usar

- Ter o Python 3.13.2 :snake: instalado na sua maquina
- Ter a IDE do VSCode instalada
- Instalar a extensão do VSCode RobotCode
- Criar um ambiente venv e instalar dependências 
    ```python -m venv venv
    venv/Scripts/activate
- Rodar no terminal o <code>pip install -r requirements.txt</code> que vai instalar todas as dependências
- Para executar apenas clicar no botão de "executar" do proprio VSCode porque temos uma configuração no robot.toml que funciona na execução do programa

## 🖥️ Tecnologias implementadas

- Robot Framework
- Selenium WebDriver
- Requests Library
- JSON Library
- Python (para geração de evidências em PDF)

A estruturação do projeto segue o padrão de "page objects" e os test cases foram escritos seguindo o Gherkin e nomenclaturas do robot


## ⚖️ License

[MIT]