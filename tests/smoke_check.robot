*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}    https://www.saucedemo.com/

*** Test Cases ***
Site Is Reachable
    [Tags]    smoke
    Open Browser    ${URL}    chrome    options=add_argument("--headless=new")
    Title Should Be    Swag Labs
    [Teardown]    Close Browser