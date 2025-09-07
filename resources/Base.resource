*** Settings ***
Documentation     Base resource file

Library       SeleniumLibrary

Resource    Settings.resource
Resource    pages/Home.resource
Resource    pages/ProductInfo.resource
Resource    variables/Web_variables.robot

*** Keywords ***

Access page
    Open Browser    ${URL}    chrome

