*** Settings ***
Documentation     Suite de testes para a API de validação de CEP

# Importando bibliotecas necessárias
Resource    ../resources/api/ValidateCep.resource

*** Test Cases ***
# Cenário 01 - Buscar CEP Válido e Validar Resposta
# Cenário 02 - Buscar CEP Inválido (Caracteres Especiais) e Validar Resposta
# Cenário 03 - Buscar CEP Inválido (Espaços) e Validar Resposta
# Cenário 04 - Buscar CEP Inválido (Letras) e Validar Resposta
# Cenário 05 - Buscar CEP Inválido (Menos de 8 Dígitos) e Validar Resposta
# Cenário 06 - Buscar CEP Inválido (Mais de 8 Dígitos) e Validar Resposta
# Cenário 07 - Buscar CEP Inexistente e Validar Resposta  
CN01 - Search CEP With a Valid CEP
    [Documentation]    Teste para buscar um CEP válido e validar a resposta da API.
    ${response}=    Given Validate Successful API Response for CEP    ${VALID_CEP}
    When Validate Response Status Code    ${response}    200
    Then Validate If Cep Is Valid    ${response}    ${VALID_CEP}

CN02 - Search CEP With an Invalid CEP (Special Characters)
    [Documentation]    Teste para buscar um CEP inválido com caracteres especiais e validar a resposta da API.
    ${response}=    Given Validate API Response for CEP Variations    ${INVALID_CEP_SPECIAL_CHAR}
    Then Validate If Cep Is Invalid    ${response}

CN03 - Search CEP With an Invalid CEP (Spaces)
    [Documentation]    Teste para buscar um CEP inválido com espaços e validar a resposta da API.    
    ${response}=    Given Validate API Response for CEP Variations    ${INVALID_CEP_SPACES}
    Then Validate If Cep Is Invalid    ${response}

CN04 - Search CEP With an Invalid CEP (Letters)    
    [Documentation]    Teste para buscar um CEP inválido com letras e validar a resposta da API.    
    ${response}=    Given Validate API Response for CEP Variations    ${INVALID_CEP_LETTERS}
    Then Validate If Cep Is Invalid    ${response}

CN05 - Search CEP With an Invalid CEP (Less Than 8 Digits)
    [Documentation]    Teste para buscar um CEP inválido com menos de 8 dígitos e validar a resposta da API.    
    ${response}=    Given Validate API Response for CEP Variations    ${INVALID_CEP_LESS_THAN_8}
    Then Validate If Cep Is Invalid    ${response}

CN06 - Search CEP With an Invalid CEP (More Than 8 Digits)
    [Documentation]    Teste para buscar um CEP inválido com mais de 8 dígitos e validar a resposta da API.    
    ${response}=    Given Validate API Response for CEP Variations    ${INVALID_CEP_MORE_THAN_8}
    Then Validate If Cep Is Invalid    ${response}

CN07 - Search CEP With a Non-Existent CEP
    [Documentation]    Teste para buscar um CEP inexistente e validar a resposta da API.    
    ${response}=    Given Validate API Response for CEP Variations    ${NON_EXISTENT_CEP}
    Then Validate If Cep Is Invalid    ${response}
    
