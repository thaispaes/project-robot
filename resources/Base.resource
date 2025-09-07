*** Settings ***
Documentation     Base resource file

Library       SeleniumLibrary

Resource    Settings.resource
Resource    pages/Home.resource

*** Keywords ***

Access page
    Open Browser    ${URL}    chrome

