*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${USERNAME_FIELD}    id:user-name
${PASSWORD_FIELD}    id:password
${LOGIN_BUTTON}       id:login-button
${ERROR_MESSAGE}      css:h3[data-test="error"]

*** Keywords ***

Login As
    [Arguments]    ${username}    ${password}
    Input Text      ${USERNAME_FIELD}    ${username}
    Input Password    ${PASSWORD_FIELD}    ${password}
    Click Button    ${LOGIN_BUTTON}

Login Error Message Should Be
    [Arguments]    ${expected_message}
    Wait Until Element Is Visible    ${ERROR_MESSAGE}
    Element Text Should Be    ${ERROR_MESSAGE}    ${expected_message}