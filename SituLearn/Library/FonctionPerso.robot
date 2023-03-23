*** Settings ***
Library        Selenium2Library
Library        Collections
Resource       ../Editor/variable.robot

*** Keywords ***

Get Child Webelements
    [Arguments]    ${locator}

    ${element}  Get WebElement  ${locator}
    ${children}  Call Method  ${element}  find_elements  by=xpath  value=child::*

    [Return]  ${children}

Open Firefox
    Open Browser    ${PAGE}        ${BROWSER} 
    Maximize Browser Window