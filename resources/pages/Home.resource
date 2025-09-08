*** Settings ***
Documentation    Acoes e elementos da pagina inicial da aplicacao

# Importando a biblioteca SeleniumLibrary para interagir com elementos web
Library    SeleniumLibrary

Resource    ../Base.resource


*** Variables ***
# Element Locators
${SEARCH_INPUT}    //input[@id='inputBusca']
${PRODUCT_LIST}    //ul[@data-testid='searchbar-dropdown-menu']
${CLOSE_BUTTON}    //div[@id='close-button-1573815308034']
${COOKIE_BUTTON}    //button[@id='onetrust-accept-btn-handler']


*** Keywords ***
# Keywords para interações com a página inicial
# Essa keyword fecha o alerta de notificações e de cookies da aplicação
Close Alert About Notifications
    [Documentation]    Fechar o alerta de notificacoes da aplicacao
    Wait Until Element Is Visible    ${CLOSE_BUTTON}
    Click Element    ${CLOSE_BUTTON}
    Element Should Be Visible    ${COOKIE_BUTTON}
    Click Button    ${COOKIE_BUTTON}
    Screenshots Capture With Test Name    HomePage

# Keyword para realizar a busca de um produto na aplicação
Search The Product In Application
    [Documentation]    Realizar a busca de um produto na aplicacao
    [Arguments]    ${PRODUCT_NAME}
    Close Alert About Notifications
    # Preencher o campo de busca com o nome do produto
    Wait Until Element Is Visible    xpath=${SEARCH_INPUT}
    Click Element    xpath=${SEARCH_INPUT}
    # Foi necessario adicionar um keyword especifica para preencher o campo de busca porque o react tinha um comportamento diferente e nao funcionava o input text nativo, 
    # entao ela foi criada para pegar cada caracter do nome do produto e ir preenchendo o campo de busca aos poucos
    Writing Element In Input    ${PRODUCT_NAME}    ${SEARCH_INPUT}
    Screenshots Capture With Test Name    SearchProduct

# Keyword para clicar no primeiro produto da lista de resultados da busca
Click In The First Product In List
    [Documentation]    Clicar no primeiro produto da lista de resultados da busca
    Wait Until Element Is Visible    xpath=${PRODUCT_LIST}
    Wait Until Element Is Visible    xpath=${PRODUCT_LIST}//li[1]
    Sleep    3s
    # Armazenar o nome do produto selecionado em uma variavel global para usar posteriormente nas validacoes
    ${product}=    Get Text    xpath=${PRODUCT_LIST}//li[1]
    Set Global Variable    ${PRODUCT_SELECTED}    ${product}
    Click Element    xpath=${PRODUCT_LIST}//li[1]
    Screenshots Capture With Test Name    ProductSelected
