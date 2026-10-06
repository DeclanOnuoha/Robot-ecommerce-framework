*** Settings ***
Library      SeleniumLibrary
Variables    ${CURDIR}/../../data/variables.py

*** Variables ***
${BROWSER}      chrome
${URL}          https://www.saucedemo.com/
${TIMEOUT}      10s
${HEADLESS}     False

*** Keywords ***
Open Application
    ${options}=    Get Chrome Options
    Open Browser    ${URL}    ${BROWSER}    options=${options}
    Maximize Browser Window
    Set Selenium Timeout    ${TIMEOUT}

Close Application
    Close All Browsers

Go To Login Page
    Delete All Cookies
    Go To    ${URL}

Get Chrome Options
    ${options}=    Evaluate    selenium.webdriver.ChromeOptions()    modules=selenium.webdriver
    Run Keyword If    '${HEADLESS}' == 'True'    Set Headless Chrome Options    ${options}
    RETURN    ${options}

Set Headless Chrome Options
    [Arguments]    ${options}
    Call Method    ${options}    add_argument    --headless=new
    Call Method    ${options}    add_argument    --window-size=1920,1080