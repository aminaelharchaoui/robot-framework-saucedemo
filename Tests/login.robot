*** Settings ***
Library     SeleniumLibrary
Test Teardown    Close Browser

*** Variables ***
${URL}        https://www.saucedemo.com
${BROWSER}    chrome

*** Test Cases ***
Valid User Can Login
    Open Browser    ${URL}    ${BROWSER}
    Input Text      id=user-name    standard_user
    Input Password  id=password     secret_sauce
    Click Button    id=login-button
    Location Should Contain    inventory
    Page Should Contain    Products

Locked Out User Sees Error
    Open Browser    ${URL}    ${BROWSER}
    Input Text      id=user-name    locked_out_user
    Input Password  id=password     secret_sauce
    Click Button    id=login-button
    Element Text Should Be    css=[data-test="error"]
    ...    Epic sadface: Sorry, this user has been locked out.