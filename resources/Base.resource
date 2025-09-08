*** Settings ***
Documentation     Base resource file

## Importing Libraries and Resources
Library       SeleniumLibrary
Library       ../resources/libs/generate_pdf.py

Resource    variables/Web_variables.resource


*** Variables ***
## Variaveis de controle
${COUNTER}    0
${SCREENSHOT_DIR}     ${OUTPUT_DIR}/screenshots
${PDF_OUTPUT}         ${OUTPUT_DIR}/relatorio_teste.pdf

*** Keywords ***
# Keywords comuns a serem reutilizados em varios cenarios de teste
Access Page
    [Documentation]    Acessar a pagina inicial da aplicacao
    Open Browser    ${URL}    chrome
    Maximize Browser Window

# Essa keyword foi essencial para a escrita do nome do produto letra por letra no campo de busca porque o campo nao reconhecia o comando Input Text nativo do SeleniumLibrary
# Entao foi necessario criar uma lista com cada caracter do nome do produto e ir pressionando
Writing Element In Input
    [Documentation]    Escrever produto no campo de busca
    [Arguments]    ${PRODUCT_NAME}    ${LOCATOR}
    # Criar uma lista com cada caracter do nome do produto para ir pressionando
    ${chars}=    Evaluate    [caracter for caracter in "${PRODUCT_NAME}"]
    FOR    ${ch}    IN    @{chars}
    # Pressionar cada tecla individualmente
        Press Keys    xpath=${LOCATOR}    ${ch}
        # Esperar um curto periodo de tempo para simular a digitação
        Sleep    0.08
    END

# Rolar a pagina para visualizar o elemento desejado
Scroll To See Element
    [Documentation]    Rolar a pagina para visualizar o elemento
    [Arguments]    ${COMPONENT}
    # Obter o elemento web
    ${ELEMENT}=    Get WebElement    ${COMPONENT}
    # Rolar a pagina para o elemento
    Scroll Element Into View    ${ELEMENT}
    Sleep    3s

# Funcao de captura de screenshot com nome do cenario de teste e contador para ordenar
Screenshots Capture With Test Name
    [Documentation]    Capturar screenshot com nome do cenario de teste
    [Arguments]    ${TEST_NAME}
    ${SCREENSHOT_DIR}=    Set Variable    ../results/screenshots
    #Incrementar contador para deixar os screenshots em ordem
    ${VALUE}=    Evaluate    ${COUNTER}+ 1
    Set Suite Variable    ${COUNTER}    ${VALUE}
    # Uso da keyword nativa do SeleniumLibrary para capturar screenshot e salvar com nome personalizado
    Capture Page Screenshot    ${SCREENSHOT_DIR}${/}Screenshot__${COUNTER}_${TEST_NAME}.png
    # Log do caminho do screenshot capturado
    Log    Screenshot captured: Screenshot__${COUNTER}_${TEST_NAME}.png

# Gerar relatorio em PDF com os screenshots do teste automatizado
Generate Test Report PDF
    [Documentation]    Gerar relatorio em PDF com os screenshots do teste
    # Chamar a funcao da biblioteca personalizada para gerar o PDF criada em python
    ${PDF_OUTPUT}=    Generate PDF From Screenshots    screenshot_dir=${SCREENSHOT_DIR}    output_pdf=${PDF_OUTPUT}
    # Log do caminho do PDF gerado
    Log    PDF gerado em: ${PDF_OUTPUT}
