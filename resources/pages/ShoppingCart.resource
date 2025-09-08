*** Settings ***
Documentation    Testes relacionados a pagina do Carrinho de compras da aplicacao

Library    SeleniumLibrary

Resource    ../Base.resource
Resource    ../variables/Web_variables.resource


*** Variables ***
${CART_TITLE}    //h2[text()="PRODUTO E SERVIÇO"]
${SCROLL_TO_ELEMENT}    //fieldset//legend[contains(text(), 'Seguro')]
${WARRANTY_OPTION}    //p[@aria-label='Garantia Estendida Kabum - 12 Meses']


*** Keywords ***
Validate Correct Product In Cart
    [Documentation]    Validar se o produto selecionado esta correto no carrinho de compras
    Wait Until Element Is Visible    ${CART_TITLE}
    Element Should Be Visible    //a[text()='${PRODUCT_SELECTED}']
    Capture Page Screenshot
    Scroll To See Element    ${SCROLL_TO_ELEMENT}
    Sleep    3s
    Element Should Be Visible    ${WARRANTY_OPTION}
    Capture Page Screenshot
