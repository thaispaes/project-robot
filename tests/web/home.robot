*** Settings ***
Documentation    Testes relacionados a pagina de HOME da aplicacao

Resource    ../../resources/Base.resource

Test Setup    Access page
Test Teardown    Close Browser

*** Test Cases ***
Find product with success
    [Documentation]    Validar a busca de um produto na aplicacao
    Given Search the product in application    PRODUCT_NAME=notebook