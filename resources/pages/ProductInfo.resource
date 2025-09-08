*** Settings ***
Documentation    Acoes e elementos da pagina inicial de informacoes do produto

# Librarie imports
Library    SeleniumLibrary

Resource    variables/Web_variables.resource
Resource    Base.resource
Resource    PreShopping.resource


*** Variables ***
# Element Locators
${SHIPPING_INPUT}    //input[@id='inputCalcularFrete']
${SHIPPING_SECTION}    //section[@id='blocoCalcularFrete']
${SHIPPING_SECTION_CLOSE}    //button[@id='botaoAlterarCEP']
${SCROLL}    //img[@alt='Banner']
${BUY_BUTTON}    //button//span[text()="Comprar agora" or text()="COMPRAR AGORA"]

*** Keywords ***
# Valida se o produto selecionado na pagina de detalhes e o mesmo que foi clicado na pagina inicial
Validate Product Selected Info Page
    [Documentation]    Validar se o produto da pagina foi o produto selecionado
    Element Should Be Visible    //h1[text()='${PRODUCT_SELECTED}']

# Utiliza o campo de CEP para buscar as opcoes de frete disponiveis
Search For Shipping Options
    [Documentation]    Buscar as opcoes de frete para o produto selecionado
    # Essa keywords serve para "descer" a tela ate o elemento desejado
    Scroll To See Element    ${SCROLL}
    Element Should Be Visible    ${SHIPPING_INPUT}
    Click Element    ${SHIPPING_INPUT}
    # Preencher o campo de CEP
    Input Text    ${SHIPPING_INPUT}    ${CEP}
    Screenshots Capture With Test Name    SearchShipping
    # Valida se o campo com o CEP buscado esta visivel
    Wait Until Element Is Visible    ${SHIPPING_SECTION}//div//span[contains=(text()='CEP: ${CEP_HIFEN}')][2]
    # Valida as opcoes de frete disponiveis
    Validate Shipping Types

# Validar os tipos de frete disponiveis para o CEP buscado
Validate Shipping Types
    [Documentation]    Validar os tipos de frete disponiveis
    Element Should Be Visible    ${SHIPPING_SECTION}
    Scroll To See Element    ${SCROLL}
    # Pega os elementos de frete disponiveis para validar e retornar os tipos 
    ${SHIPPING_TYPES}=    Get WebElements    ${SHIPPING_SECTION}//li//span[contains(text(),'Entrega')]
    # Define o range de fretes que quero validar para que caso o xpath pegue mais opcoes nao me retorne
    ${RANGE}=    Set Variable    3
    # Loop para validar os tipos de frete disponiveis
    FOR    ${INDEX}    IN RANGE    ${RANGE}
        ${TYPES}=    Get Text    ${SHIPPING_TYPES}[${INDEX}]
        # Log dos tipos de frete disponiveis
        Log    Frete disponível: ${TYPES}
    END
    Screenshots Capture With Test Name    ValidateShippingOptions

# Fechar a sessao de opcoes de frete
Closing Shipping Options Section
    [Documentation]    Fechar a sessao de opcoes de frete
    Element Should Be Visible    ${SHIPPING_SECTION}
    Click Element    ${SHIPPING_SECTION_CLOSE}
    Sleep    5s
    Wait Until Element Is Visible    ${SHIPPING_INPUT}
    Screenshots Capture With Test Name    ClosedShippingSection

# Segue para a "compra" do produto selecionado
Select To Buy The Product
    [Documentation]    Selecionar o produto para compra e validar se o produto foi adicionado ao carrinho
    Scroll To See Element    ${SCROLL}
    # Clicar no botão de compra
    Click Element    ${BUY_BUTTON}
    Sleep    5s
    Screenshots Capture With Test Name    ClickedToBuy
    # Validar se a garantia e a remocao do seguro foram selecionados
    Validate If Warranty And Insurance Is Selected
    # Validar se o produto foi adicionado ao carrinho
    Validate If The Product Is Added In The Cart
    # Seguir para o carrinho de compras
    Go To Shopping Cart
    Log    Produto adicionado ao carrinho com sucesso
