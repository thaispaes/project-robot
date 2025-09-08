*** Settings ***
Documentation     Base resource file

Library       SeleniumLibrary

Resource    variables/Web_variables.resource


*** Keywords ***
Access Page
    [Documentation]    Acessar a pagina inicial da aplicacao
    Open Browser    ${URL}    chrome
    Maximize Browser Window

Writing Element In Input
    [Documentation]    Escrever produto no campo de busca
    [Arguments]    ${PRODUCT_NAME}    ${LOCATOR}
    ${chars}=    Evaluate    [caracter for caracter in "${PRODUCT_NAME}"]
    FOR    ${ch}    IN    @{chars}
        Press Keys    xpath=${LOCATOR}    ${ch}
        Sleep    0.08
    END

Scroll To See Element
    [Documentation]    Rolar a pagina para visualizar o elemento
    [Arguments]    ${COMPONENT}
    ${ELEMENT}=    Get WebElement    ${COMPONENT}
    Scroll Element Into View    ${ELEMENT}
    Sleep    3s
