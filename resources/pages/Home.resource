*** Settings ***
Documentation    Acoes e elementos da pagina inicial da aplicacao

Library    SeleniumLibrary

Resource    variables/Web_variables.robot

*** Variables ***
${SEARCH_INPUT}    //input[@id='inputBusca']
${PRODUCT_LIST}    //ul[@data-testid='searchbar-dropdown-menu']


*** Keywords ***
Search the product in application
    [Arguments]    ${PRODUCT_NAME}
    Wait Until Element Is Visible    xpath=${SEARCH_INPUT}
    Click Element    xpath=${SEARCH_INPUT}
    Writing element in input search    ${PRODUCT_NAME}
    Capture Page Screenshot

Writing element in input search
    [Arguments]    ${PRODUCT_NAME}
    ${chars}=    Evaluate    [caracter for caracter in "${PRODUCT_NAME}"]
    FOR    ${ch}    IN    @{chars}
        Press Keys    xpath=${SEARCH_INPUT}    ${ch}
        Sleep    0.08
    END
    
Click in the first product in list
    Wait Until Element Is Visible    xpath=${PRODUCT_LIST}
    Element Should Be Visible    xpath=${PRODUCT_LIST}
    Wait Until Element Is Visible    xpath=${PRODUCT_LIST}//li[1]
    
    Sleep    3s 
    ${product}=    Get Text    xpath=${PRODUCT_LIST}//li[1]
    Set Global Variable    ${PRODUCT_SELECTED}    ${product}
    Click Element    xpath=${PRODUCT_LIST}//li[1]
   
    Capture Page Screenshot