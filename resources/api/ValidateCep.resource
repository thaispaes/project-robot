*** Settings ***
Documentation     Acoes para a API de validação de CEP

Library    RequestsLibrary
Library    Collections
Library    String
Library    JSONLibrary

Resource    ../resources/variables/Api_variables.resource

*** Keywords ***
Create Sessions API
    [Documentation]    Criar a sessao para a API
    [Arguments]    ${base_url}
    Create Session    api_session    ${base_url}
    Log    Sessao criada com sucesso.

Validate Successful API Response for CEP
    [Documentation]    Validar a resposta bem-sucedida da API para um CEP válido.
    [Arguments]    ${valid_cep}
    Create Sessions API    ${BASE_URL}
    ${response}=    Get On Session    api_session    /ws/${valid_cep}/json/
    Log    Status code: ${response.status_code}
    Log    Resposta: ${response.text}
    Return From Keyword    ${response}

Validate API Response for CEP Variations
    [Documentation]    Validar a resposta da API para variações de CEP inválidos.
    [Arguments]    ${invalid_cep}
    Create Sessions API    ${BASE_URL}
    ${response}=   Run Keyword And Ignore Error    Get On Session    api_session    /ws/${invalid_cep}/json
    ${status}=    Set Variable    ${response}[0]
    IF  '${status}'== 'FAIL'
        Log    CEP inválido ou com caracteres especiais: ${invalid_cep}    WARN
        Log    Status code retornado: 400 ${response}[0]
        Log    Resposta da API: ${response}[1]
    ELSE
        Log    Status code: ${response}[0]
        Log    Resposta do CEP ${invalid_cep}: ${response}[1] porque o CEP é válido mas nao encontrado
    END

    Return From Keyword    ${response}


Validate Response Status Code
    [Documentation]    Validar o status code da resposta da API.
    [Arguments]    ${response}    ${expected_status_code}
    Should Be Equal As Integers    ${response.status_code}    ${expected_status_code}

Remove Hifen From CEP
    [Documentation]    Remover o hífen do CEP, se presente.
    [Arguments]    ${cep}
    ${cep_json}=    Replace String    ${cep}    -    ${EMPTY}
    Return From Keyword    ${cep_json}

Validate If Cep Is Valid
    [Documentation]    Validar se o CEP é válido.
    [Arguments]    ${response}    ${expected_cep}
    ${response_json}=    Get From Dictionary    ${response.json()}    cep
    ${response_json}=    Remove Hifen From CEP    ${response_json}
    Should Be Equal    ${response_json}    ${expected_cep}
    Log    CEP ${expected_cep} válido.

Validate If Cep Is Invalid
    [Documentation]    Validar se o CEP é inválido.
    [Arguments]    ${response}

    ${status}=    Set Variable    ${response}[0]

    IF    '${status}' == 'PASS'
        Log    Codigo validado! Deu ${response}[1] porque o CEP é válido mas nao encontrado
    ELSE
        Log    Status code retornado: 400 ${response}[0] porque o CEP é inválido
    END

