*** Settings ***
Documentation    Testes relacionados a pagina do Carrinho de compras da aplicacao

## Libraries
Library    SeleniumLibrary

Resource    ../Base.resource
Resource    ../variables/Web_variables.resource


*** Variables ***
# Variaveis Locais dos locators da pagina
${CART_TITLE}    //h2[text()="PRODUTO E SERVIÇO"]
${SCROLL_TO_ELEMENT}    //fieldset//legend[contains(text(), 'Seguro')]
${WARRANTY_OPTION}    //p[@aria-label='Garantia Estendida Kabum - 12 Meses']


*** Keywords ***
# Valida se o produto selecionado esta correto no carrinho de compras
Validate Correct Product In Cart
    [Documentation]    Validar se o produto selecionado esta correto no carrinho de compras
    Wait Until Element Is Visible    ${CART_TITLE}
    # Validar se o produto no carrinho e o produto selecionado
    Element Should Be Visible    //a[text()='${PRODUCT_SELECTED}']
    Scroll To See Element    ${SCROLL_TO_ELEMENT}
    Sleep    3s
    # Valida se a opcao de garantia estendida esta visivel e selecionada
    Element Should Be Visible    ${WARRANTY_OPTION}
