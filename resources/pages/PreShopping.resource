*** Settings ***
Documentation    Acoes e elementos da pagina pre carrinho de compras 

Library    SeleniumLibrary

Resource    variables/Web_variables.resource
Resource    Base.resource

*** Variables ***
${CART_ADD_CONFIRMATION}    //strong[text()="Produto adicionado no carrinho"] 
${INSURANCE_INPUT}    //input[@name='seguro' and @type='radio'][1]
${SCROLL_ELEMENT}        //h3[text()='Informações Importantes']
${ADD_SERVICES_BUTTON}    //button//span[text()='Adicionar serviços']

*** Keywords ***
Validate If The Product Is Added In The Cart
    [Documentation]    Validar se o produto foi adicionado no carrinho de compras
    Element Should Be Visible      ${CART_ADD_CONFIRMATION}
    Element Should Be Visible    //h2[text()='${PRODUCT_SELECTED}']

Validate If Warranty And Insurance Is Selected
    [Documentation]    Validar se a garantia estendida e seguro estao selecionados ou nao
    Radio Button Should Be Set To    ${INPUT_NAME_WARRANTY}    ${INPUT_VALUE_WARRANTY}
    Scroll To See Element    ${SCROLL_ELEMENT}
    Element Should Be Visible    ${INSURANCE_INPUT}
    Sleep    5s
    Select Radio Button    ${INPUT_NAME_INSURANCE}    ${INPUT_VALUE_INSURANCE}
    Capture Page Screenshot

Go To Shopping Cart
    [Documentation]    Acessar o carrinho de compras apos adicionar o produto e a garantia
    Element Should Be Visible    ${ADD_SERVICES_BUTTON}
    Click Element    ${ADD_SERVICES_BUTTON}
    Capture Page Screenshot
