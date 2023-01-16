*** Settings ***
Library        Selenium2Library

*** Keywords ***

Get Child Webelements
    [Arguments]    ${locator}

    ${element}  Get WebElement  ${locator}
    ${children}  Call Method  ${element}  find_elements  by=xpath  value=child::*

    [Return]  ${children}