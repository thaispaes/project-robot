*** Settings ***
Documentation    Acoes e elementos da pagina inicial de informacoes do produto

Library    SeleniumLibrary

Resource    variables/Web_variables.robot

*** Variables ***   
${SHIPPING_INPUT}    //input[@id='inputCalcularFrete']
${SHIPPING_SECTION}    //section[@id='blocoCalcularFrete']  


*** Keywords ***
Validate product selected info page
    Element Should Be Visible    //h1[text()='${PRODUCT_SELECTED}']

Search for shipping options
    Element Should Be Visible    ${SHIPPING_INPUT}
    Input Text    ${SHIPPING_INPUT}    ${CEP}
    Wait Until Element Is Visible    //span[contains(text(),'${CEP}')]
    Validate shipping types
    Capture Page Screenshot

Validate shipping types
   Element Should Be Visible    ${SHIPPING_SECTION}
   ${ELEMENT}=    Get WebElement    ${SHIPPING_SECTION}
   Scroll Element Into View    ${ELEMENT}




   
   

