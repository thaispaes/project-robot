*** Settings ***
Documentation    Acoes e elementos da pagina inicial da aplicacao

Library    SeleniumLibrary

Resource    ../Base.resource

*** Variables ***
${SEARCH_INPUT}    //input[@id='inputBusca']
${PRODUCT_LIST}    //ul[@data-testid='searchbar-dropdown-menu']


*** Keywords ***
Search The Product In Application
    [Documentation]    Realizar a busca de um produto na aplicacao
    [Arguments]    ${PRODUCT_NAME}
    Wait Until Element Is Visible    xpath=${SEARCH_INPUT}
    Click Element    xpath=${SEARCH_INPUT}
    Writing Element In Input    ${PRODUCT_NAME}    ${SEARCH_INPUT}
    Capture Page Screenshot

Click In The First Product In List
    [Documentation]    Clicar no primeiro produto da lista de resultados da busca
    Wait Until Element Is Visible    xpath=${PRODUCT_LIST}
    Element Should Be Visible    xpath=${PRODUCT_LIST}
    Wait Until Element Is Visible    xpath=${PRODUCT_LIST}//li[1]
    Sleep    3s
    ${product}=    Get Text    xpath=${PRODUCT_LIST}//li[1]
    Set Global Variable    ${PRODUCT_SELECTED}    ${product}
    Click Element    xpath=${PRODUCT_LIST}//li[1]
    Capture Page Screenshot

