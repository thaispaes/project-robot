*** Settings ***
Documentation    Acoes e elementos da pagina pre carrinho de compras 

Library    SeleniumLibrary

Resource    variables/Web_variables.robot
Resource    Base.resource

*** Variables ***
${CART_ADD_CONFIRMATION}    //strong[text()="Produto adicionado no carrinho"]
${CART_ADD_PRODUCT}    //h2[text()=${PRODUCT_SELECTED}]
${WARRANTY_INPUT}    //div//input[@name='garantia'][1]
${INSURANCE_INPUT}    //div//input[@name='seguro'][1]
${ADD_SERVICES_BUTTON}    //button//span[text()='Adicionar serviços']

*** Keywords ***
Validate if the product is add in the cart
    Element Should Be Visible      ${CART_ADD_CONFIRMATION}
    Element Should Be Visible    ${CART_ADD_PRODUCT}

Validate if warranty and insurance is selected
    Checkbox Should Be Selected    ${WARRANTY_INPUT}
    Scroll to see element    ${INSURANCE_INPUT} 
    Element Should Be Visible    ${INSURANCE_INPUT}
    Click Element    //div//input[@name='seguro'][2]

Go to shopping cart 
    Element Should Be Visible    ${ADD_SERVICES_BUTTON}
    Click Element    ${ADD_SERVICES_BUTTON}
    
    



