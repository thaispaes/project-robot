*** Settings ***
Documentation     Base resource file

Library       SeleniumLibrary
Library       ../resources/libs/generate_pdf.py

Resource    variables/Web_variables.resource


*** Variables ***
${COUNTER}    0
${SCREENSHOT_DIR}     ${OUTPUT_DIR}/screenshots
${PDF_OUTPUT}         ${OUTPUT_DIR}/relatorio_teste.pdf

*** Keywords ***
Access Page
    [Documentation]    Acessar a pagina inicial da aplicacao
    Open Browser    ${URL}    chrome
    Maximize Browser Window

Writing Element In Input
    [Documentation]    Escrever produto no campo de busca
    [Arguments]    ${PRODUCT_NAME}    ${LOCATOR}
    ${chars}=    Evaluate    [caracter for caracter in "${PRODUCT_NAME}"]
    FOR    ${ch}    IN    @{chars}
        Press Keys    xpath=${LOCATOR}    ${ch}
        Sleep    0.08
    END

Scroll To See Element
    [Documentation]    Rolar a pagina para visualizar o elemento
    [Arguments]    ${COMPONENT}
    ${ELEMENT}=    Get WebElement    ${COMPONENT}
    Scroll Element Into View    ${ELEMENT}
    Sleep    3s

Screenshots Capture With Test Name
    [Documentation]    Capturar screenshot com nome do cenario de teste
    [Arguments]    ${TEST_NAME}
    ${SCREENSHOT_DIR}=    Set Variable    ../results/screenshots
    #Incrementar contador para deixar os screenshots em ordem
    ${VALUE}=    Evaluate    ${COUNTER}+ 1
    Set Suite Variable    ${COUNTER}    ${VALUE}
    Capture Page Screenshot    ${SCREENSHOT_DIR}${/}Screenshot__${COUNTER}_${TEST_NAME}.png
    Log    Screenshot captured: Screenshot__${COUNTER}_${TEST_NAME}.png

Generate Test Report PDF
    [Documentation]    Gerar relatorio em PDF com os screenshots do teste
    ${PDF_OUTPUT}=    Generate PDF From Screenshots    screenshot_dir=${SCREENSHOT_DIR}    output_pdf=${PDF_OUTPUT}
    Log    PDF gerado em: ${PDF_OUTPUT}
