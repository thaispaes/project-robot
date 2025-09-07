*** Settings ***
Documentation     Base resource file

Library       SeleniumLibrary

Resource    Settings.resource
Resource    pages/Home.resource
Resource    pages/ProductInfo.resource
Resource    pages/PreShopping.resource
Resource    variables/Web_variables.robot

*** Keywords ***

Access page
    Open Browser    ${URL}    chrome
    Maximize Browser Window

Writing element in input
    [Arguments]    ${PRODUCT_NAME}    ${lOCATOR}
    ${chars}=    Evaluate    [caracter for caracter in "${PRODUCT_NAME}"]
    FOR    ${ch}    IN    @{chars}
        Press Keys    xpath=${lOCATOR}    ${ch}
        Sleep    0.08
    END

Scroll to see element
    [Arguments]    ${COMPONENT}
    ${ELEMENT}=    Get WebElement    ${COMPONENT}
    Scroll Element Into View    ${ELEMENT}
    Sleep    3s