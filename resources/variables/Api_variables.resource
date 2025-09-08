*** Settings ***
Documentation    Variaveis globais para o teste da API

# Variaveis de teste da API ViaCEP
*** Variables ***
${BASE_URL}    https://viacep.com.br
# Testando todas as possibilidades de CEP
${VALID_CEP}    20040002
${INVALID_CEP_SPECIAL_CHAR}    2004@002
${INVALID_CEP_SPACES}    123 45678
${INVALID_CEP_LETTERS}    12A45B78
${INVALID_CEP_LESS_THAN_8}    1234567
${INVALID_CEP_MORE_THAN_8}    123456789
${NON_EXISTENT_CEP}    52120430
