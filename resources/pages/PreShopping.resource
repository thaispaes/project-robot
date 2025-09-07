*** Settings ***
Documentation    Acoes e elementos da pagina pre carrinho de compras 

Library    SeleniumLibrary

Resource    variables/Web_variables.robot
Resource    Base.resource

*** Variables ***
${CART_ADD_CONFIRMATION}    //strong[text()="Produto adicionado no carrinho"] 
${INSURANCE_INPUT}    //input[@name='seguro' and @type='radio'][1]
${SCROLL_ELEMENT}        //h3[text()='Informações Importantes']
${ADD_SERVICES_BUTTON}    //button//span[text()='Adicionar serviços']

*** Keywords ***
Validate if the product is add in the cart
    Element Should Be Visible      ${CART_ADD_CONFIRMATION}
    Element Should Be Visible    //h2[text()='${PRODUCT_SELECTED}']
    

Validate if warranty and insurance is selected
    Radio Button Should Be Set To    garantia    4342883
    Scroll to see element    ${SCROLL_ELEMENT} 
    Element Should Be Visible    ${INSURANCE_INPUT}
    Sleep    5s
    Select Radio Button    seguro    0
    Capture Page Screenshot

Go to shopping cart 
    Element Should Be Visible    ${ADD_SERVICES_BUTTON}
    Click Element    ${ADD_SERVICES_BUTTON}
    Capture Page Screenshot
    
    



