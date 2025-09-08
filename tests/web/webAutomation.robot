*** Settings ***
Documentation    Testes relacionados a pagina de HOME da aplicacao

# Libraries e Resources
Resource    ../../resources/Web.resource

# Teste incial e final da suite de teste
Suite Setup    Access Page
Suite Teardown    Close Browser

*** Test Cases ***
# Teste de busca de produto com sucesso na aplicacao
Find product with success
    [Documentation]    Validar a busca de um produto na aplicacao
    Given Search The Product In Application    ${PRODUCT}
    When Click In The First Product In List
    And Validate Product Selected Info Page
    And Search For Shipping Options
    And Closing Shipping Options Section
    And Select To Buy The Product
    And Validate Correct Product In Cart
    Then Generate Test Report PDF
