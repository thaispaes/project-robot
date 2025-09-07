*** Settings ***
Documentation    Testes relacionados a pagina de HOME da aplicacao

Resource    ../../resources/Base.resource

Test Setup    Access page

*** Test Cases ***
Find product with success
    [Documentation]    Validar a busca de um produto na aplicacao
    Given Search the product in application    ${PRODUCT}
    When Click in the first product in list
    And Validate product selected info page
    #And Search for shipping options     
    #And Validate shipping types - Not working
    #And Closing shipping options section
    And Select to buy the product

