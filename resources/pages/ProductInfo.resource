*** Settings ***
Documentation    Acoes e elementos da pagina inicial de informacoes do produto

Library    SeleniumLibrary

Resource    variables/Web_variables.robot
Resource    Base.resource

*** Variables ***   
${SHIPPING_INPUT}    //input[@id='inputCalcularFrete']
${SHIPPING_SECTION}    //section[@id='blocoCalcularFrete']
${SHIPPING_SECTION_CLOSE}    //button[@id='botaoAlterarCEP']
${SCROLL}    //img[@alt='Banner']
${BUY_BUTTON}    //button//span[text()="Comprar agora" or text()="COMPRAR AGORA"]


*** Keywords ***
Validate product selected info page
    Element Should Be Visible    //h1[text()='${PRODUCT_SELECTED}']

Search for shipping options
    Scroll to see element    ${SCROLL}
    Element Should Be Visible    ${SHIPPING_INPUT}
    Click Element    ${SHIPPING_INPUT}   
    Input Text    ${SHIPPING_INPUT}    ${CEP}
    Wait Until Element Is Visible    ${SHIPPING_SECTION}//div//span[contains=(text()='CEP: 52071-321')][2]    timeout=10s
    #Validate shipping types NOT WORKING
    Capture Page Screenshot

Validate shipping types
   Element Should Be Visible    ${SHIPPING_SECTION}
   Scroll to see element    ${SHIPPING_SECTION}

Closing shipping options section
    Element Should Be Visible    ${SHIPPING_SECTION}
    Click Element    ${SHIPPING_SECTION_CLOSE}
    Sleep    5s
    Wait Until Element Is Visible    ${SHIPPING_INPUT}
    Capture Page Screenshot

Select to buy the product
    Scroll to see element    ${SCROLL}
    Click Element    ${BUY_BUTTON}
    Capture Page Screenshot
    Sleep    5s
    Validate if the product is add in the cart
    Capture Page Screenshot
    Validate if warranty and insurance is selected
    Capture Page Screenshot
    Go to shopping cart
    Sleep    5s
    Capture Page Screenshot









   
   

