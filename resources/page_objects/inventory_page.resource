*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${INVENTORY_CONTAINER}    id:inventory_container

*** Keywords ***
Inventory Page Should Be Open
    Wait Until Element Is Visible    ${INVENTORY_CONTAINER}
    Location Should Contain    inventory.html