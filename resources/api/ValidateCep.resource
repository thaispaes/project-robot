*** Settings ***
Documentation     Acoes para a API de validação de CEP

#Librarys usadas no projeto
Library    RequestsLibrary
Library    Collections
Library    String
Library    JSONLibrary

#Importando arquivos de variaveis globais
Resource    ../resources/variables/Api_variables.resource

*** Keywords ***
#Criacao da sessao para a API do ViaCEP
Create Sessions API
    [Documentation]    Criar a sessao para a API
    [Arguments]    ${base_url}
    Create Session    api_session    ${base_url}
    Log    Sessao criada com sucesso.

#A keyword e responsavel por validar a resposta da API para um CEP valido
Validate Successful API Response for CEP
    [Documentation]    Validar a resposta bem-sucedida da API para um CEP válido.
    [Arguments]    ${valid_cep}
    Create Sessions API    ${BASE_URL}
    ${response}=    Get On Session    api_session    /ws/${valid_cep}/json/
    # Validar o status code da resposta
    Validate Response Status Code    ${response}    200     # Espera-se um status code 200 para sucesso
    # Validar se o CEP na resposta corresponde ao CEP esperado
    Log    Status code: ${response.status_code}
    Log    Resposta: ${response.text}
    # Retornando a resposta da API para ser usada em outras keywords
    Return From Keyword    ${response}

#Keyword para validar a resposta da API para variações de CEP inválidos
Validate API Response for CEP Variations
    [Documentation]    Validar a resposta da API para variações de CEP inválidos.
    [Arguments]    ${invalid_cep}
    Create Sessions API    ${BASE_URL}
    # Tentar obter a resposta da API e mesmo que de erro o teste continua e captura a resposta
    ${response}=   Run Keyword And Ignore Error    Get On Session    api_session    /ws/${invalid_cep}/json
    ${status}=    Set Variable    ${response}[0]
    # Logica condicional para tratar diferentes tipos de respostas
    IF  '${status}'== 'FAIL'
    # Sabemos aqui se der FAIL e porque o CEP é inválido ou com caracteres especiais
        Log    CEP inválido ou com caracteres especiais: ${invalid_cep}    WARN
        Log    Status code retornado: 400 ${response}[0]
        Log    Resposta da API: ${response}[1]
    ELSE
    # Sabemos aqui se der PASS é porque o CEP é válido mas nao encontrado na base
        Log    Status code: ${response}[0]
        Log    Resposta do CEP ${invalid_cep}: ${response}[1] porque o CEP é válido mas nao encontrado
    END
    # Retornando a resposta da API para ser usada em outras keywords
    Return From Keyword    ${response}


#Keyword para validar o status code da resposta da API
Validate Response Status Code
    [Documentation]    Validar o status code da resposta da API.
    [Arguments]    ${response}    ${expected_status_code}
    # Verifica se o status code da resposta é igual ao esperado
    Log    Validando status code. Esperado: ${expected_status_code}, Recebido: ${response.status_code}
    Should Be Equal As Integers    ${response.status_code}    ${expected_status_code}
    Log    Status code validado com sucesso.

#Keyword para remover hífen do CEP retornado pela API
Remove Hifen From CEP
    [Documentation]    Remover o hífen do CEP, se presente.
    [Arguments]    ${cep}
    # Remove o hifen do CEP passado como argumento
    ${cep_json}=    Replace String    ${cep}    -    ${EMPTY}
    # Retornando o CEP sem hífen
    Return From Keyword    ${cep_json}

#Keyword para validar se o CEP é válido
Validate If Cep Is Valid
    [Documentation]    Validar se o CEP é válido.
    [Arguments]    ${response}    ${expected_cep}
    ${response_json}=    Get From Dictionary    ${response.json()}    cep
    ${response_json}=    Remove Hifen From CEP    ${response_json}
    # Verifica se o CEP retornado pela API é igual ao CEP esperado
    Log    Validando CEP.
    Should Be Equal    ${response_json}    ${expected_cep}
    Log    CEP ${expected_cep} válido.

# Keyword para validar se o CEP é inválido e porque foi invalidado
Validate If Cep Is Invalid
    [Documentation]    Validar se o CEP é inválido.
    [Arguments]    ${response}

    ${status}=    Set Variable    ${response}[0]
    # Logica condicional para tratar diferentes tipos de respostas
    # Sabemos aqui se der PASS é porque o CEP é válido mas nao encontrado na base
    IF    '${status}' == 'PASS'
        Log    Codigo validado! Deu ${response}[1] porque o CEP é válido mas nao encontrado
    ELSE
    # Sabemos aqui se der FAIL e porque o CEP é inválido ou com caracteres especiais
        Log    Codigo invalidado! 
        Log    Status code retornado: 400 ${response}[0] porque o CEP é inválido
    END

