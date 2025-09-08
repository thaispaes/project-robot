*** Settings ***
Documentation    Acoes e elementos da pagina inicial da aplicacao

Library    SeleniumLibrary

Resource    ../Base.resource


*** Variables ***
${SEARCH_INPUT}    //input[@id='inputBusca']
${PRODUCT_LIST}    //ul[@data-testid='searchbar-dropdown-menu']
${CLOSE_BUTTON}    //div[@id='close-button-1573815308034']
${COOKIE_BUTTON}    //button[@id='onetrust-accept-btn-handler']


*** Keywords ***
Close Alert About Notifications
    [Documentation]    Fechar o alerta de notificacoes da aplicacao
    Wait Until Element Is Visible    ${CLOSE_BUTTON}
    Click Element    ${CLOSE_BUTTON}
    Element Should Be Visible    ${COOKIE_BUTTON}
    Click Button    ${COOKIE_BUTTON}
    Screenshots Capture With Test Name    HomePage

Search The Product In Application
    [Documentation]    Realizar a busca de um produto na aplicacao
    [Arguments]    ${PRODUCT_NAME}
    Close Alert About Notifications
    Wait Until Element Is Visible    xpath=${SEARCH_INPUT}
    Click Element    xpath=${SEARCH_INPUT}
    Writing Element In Input    ${PRODUCT_NAME}    ${SEARCH_INPUT}
    Screenshots Capture With Test Name    SearchProduct

Click In The First Product In List
    [Documentation]    Clicar no primeiro produto da lista de resultados da busca
    Wait Until Element Is Visible    xpath=${PRODUCT_LIST}
    Wait Until Element Is Visible    xpath=${PRODUCT_LIST}//li[1]
    Sleep    3s
    ${product}=    Get Text    xpath=${PRODUCT_LIST}//li[1]
    Set Global Variable    ${PRODUCT_SELECTED}    ${product}
    Click Element    xpath=${PRODUCT_LIST}//li[1]
    Screenshots Capture With Test Name    ProductSelected
