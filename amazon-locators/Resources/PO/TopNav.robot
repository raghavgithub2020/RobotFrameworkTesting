*** Settings ***
Documentation  Amazon top navigation
Library  SeleniumLibrary

*** Variables ***
${TOPNAV_SEARCH_BAR} =      id=twotabsearchtextbox
${TOPNAV_SEARCH_BUTTON} =   xpath=//*[@id="nav-search"]/form/div[2]/div/input

*** Keywords ***
Search for Products
    [Arguments]  ${SearchTerm}
    Enter Search Term  ${SearchTerm}
    Submit Search

Enter Search Term
    [Arguments]  ${SearchTerm}
    Input Text  ${TOPNAV_SEARCH_BAR}  ${SearchTerm}

Submit Search
    Click Button  ${TOPNAV_SEARCH_BUTTON}