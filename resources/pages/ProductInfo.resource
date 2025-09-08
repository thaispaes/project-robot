*** Settings ***
Documentation    Acoes e elementos da pagina inicial de informacoes do produto

Library    SeleniumLibrary

Resource    variables/Web_variables.resource
Resource    Base.resource
Resource    PreShopping.resource


*** Variables ***
${SHIPPING_INPUT}    //input[@id='inputCalcularFrete']
${SHIPPING_SECTION}    //section[@id='blocoCalcularFrete']
${SHIPPING_SECTION_CLOSE}    //button[@id='botaoAlterarCEP']
${SCROLL}    //img[@alt='Banner']
${BUY_BUTTON}    //button//span[text()="Comprar agora" or text()="COMPRAR AGORA"]
${SHIPPING_TYPE_1}    ${SHIPPING_INPUT}//li//span[text()='Entrega Econômica']
${SHIPPING_TYPE_2}    ${SHIPPING_INPUT}//li//span[text()='Entrega Padrão']
${SHIPPING_TYPE_3}    ${SHIPPING_INPUT}//li//span[text()='Entrega Expressa']


*** Keywords ***
Validate Product Selected Info Page
    [Documentation]    Validar se o produto da pagina foi o produto selecionado
    Element Should Be Visible    //h1[text()='${PRODUCT_SELECTED}']

Search For Shipping Options
    [Documentation]    Buscar as opcoes de frete para o produto selecionado
    Scroll To See Element    ${SCROLL}
    Element Should Be Visible    ${SHIPPING_INPUT}
    Click Element    ${SHIPPING_INPUT}
    Input Text    ${SHIPPING_INPUT}    ${CEP}
    Wait Until Element Is Visible    ${SHIPPING_SECTION}//div//span[contains=(text()='CEP: ${CEP_HIFEN}')][2]
    Validate Shipping Types
    Capture Page Screenshot

Validate Shipping Types
    [Documentation]    Validar os tipos de frete disponiveis
    Element Should Be Visible    ${SHIPPING_SECTION}
    Scroll To See Element    ${SCROLL}
    ${SHIPPING_TYPES}=    Get WebElements    ${SHIPPING_SECTION}//li//span[contains(text(),'Entrega')]
    ${RANGE}=    Set Variable    3
    FOR    ${INDEX}    IN RANGE    ${RANGE}
        ${TYPES}=    Get Text    ${SHIPPING_TYPES}[${INDEX}]
        Log    Frete disponível: ${TYPES}
    END

Closing Shipping Options Section
    [Documentation]    Fechar a sessao de opcoes de frete
    Element Should Be Visible    ${SHIPPING_SECTION}
    Click Element    ${SHIPPING_SECTION_CLOSE}
    Sleep    5s
    Wait Until Element Is Visible    ${SHIPPING_INPUT}
    Capture Page Screenshot

Select To Buy The Product
    [Documentation]    Selecionar o produto para compra e validar se o produto foi adicionado ao carrinho
    Scroll To See Element    ${SCROLL}
    Click Element    ${BUY_BUTTON}
    Sleep    5s
    Capture Page Screenshot
    Validate If Warranty And Insurance Is Selected
    Validate If The Product Is Added In The Cart
    Go To Shopping Cart
    Log    Produto adicionado ao carrinho com sucesso
