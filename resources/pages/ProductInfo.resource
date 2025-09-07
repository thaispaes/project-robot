*** Settings ***
Documentation    Acoes e elementos da pagina inicial de informacoes do produto

Library    SeleniumLibrary

Resource    variables/Web_variables.robot

*** Variables ***   
${SHIPPING_INPUT}    //input[@id='inputCalcularFrete']
${SHIPPING_SECTION}    //section[@id='blocoCalcularFrete']
${SHIPPING_SECTION_CLOSE}    //button[@id='botaoAlterarCEP']


*** Keywords ***
Validate product selected info page
    Element Should Be Visible    //h1[text()='${PRODUCT_SELECTED}']

Search for shipping options
    Scroll to see element    ${SHIPPING_INPUT}
    Element Should Be Visible    ${SHIPPING_INPUT}    
    Input Text    ${SHIPPING_INPUT}    ${CEP}
    Sleep    3s
    Wait Until Element Is Visible    //span[contains(text(),'${CEP}')]    timeout=10s
    Validate shipping types
    Capture Page Screenshot

Validate shipping types
   Element Should Be Visible    ${SHIPPING_SECTION}
   Scroll to see element    ${SHIPPING_SECTION}

Closing shipping options section
    Element Should Be Visible    ${SHIPPING_SECTION}
    Scroll to see element    ${SHIPPING_SECTION}
    Click Element    ${SHIPPING_SECTION_CLOSE}
    Wait Until Element Is Visible    ${SHIPPING_INPUT}

Scroll to see element
    [Arguments]    ${COMPONENT}
    ${ELEMENT}=    Get WebElement    ${COMPONENT}
    Scroll Element Into View    ${ELEMENT}
    Sleep    3s





   
   

