*** Settings ***
Documentation    Testes relacionados a pagina de HOME da aplicacao

Resource    ../../resources/Web.resource

Test Setup    Access page

*** Test Cases ***
Find product with success
    [Documentation]    Validar a busca de um produto na aplicacao
    Given Search the product in application    ${PRODUCT}
    When Click in the first product in list
    And Validate Product Selected Info Page
    #And Search For Shipping Options
    #And Validate Shipping Types
    #And Closing Shipping Options Section
    #And Select To Buy The Product
    #Then Validate Correct Product In Cart
