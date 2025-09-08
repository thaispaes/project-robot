*** Settings ***
Documentation    Testes relacionados a pagina de HOME da aplicacao

Resource    ../../resources/Web.resource

Test Setup    Access Page
Test Teardown    Close Browser


*** Test Cases ***
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
