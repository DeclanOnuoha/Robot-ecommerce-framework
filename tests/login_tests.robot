*** Settings ***
Resource        ../resources/page_objects/common.resource
Resource        ../resources/page_objects/login_page.resource
Resource        ../resources/page_objects/inventory_page.resource
Suite Setup      Open Application
Suite Teardown    Close Application
Test Teardown    Go To Login Page

*** Test Cases ***
Valid Login Should Land On Inventory Page
    [Tags]    login    smoke
    Login As    ${USERS}[standard][username]    ${USERS}[standard][password]
    Inventory Page Should Be Open

Invalid Password Shows Error Message
    [Tags]    login    negative
    Login As    ${USERS}[invalid_password][username]    ${USERS}[invalid_password][password]
    Login Error Message Should Be
    ...    Epic sadface: Username and password do not match any user in this service

Locked Out User Cannot Log In
    [Tags]    login    negative
    Login As    ${USERS}[locked_out][username]    ${USERS}[locked_out][password]
    Login Error Message Should Be    Epic sadface: Sorry, this user has been locked out.