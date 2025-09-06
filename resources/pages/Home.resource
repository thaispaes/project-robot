*** Settings ***
Documentation    Acoes e elementos da pagina inicial da aplicacao

Library    SeleniumLibrary

*** Variables ***
${SEARCH_INPUT}    //input[@data-testid='searchbar-search-input']

*** Keywords ***
Search the product in application
    [Arguments]    ${PRODUCT_NAME}
    Element Should Be Visible    ${SEARCH_INPUT}
    Input Text    ${SEARCH_INPUT}    notebook
    ${HTML}=    Get Source
    Log     ${HTML}