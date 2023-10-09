*** Settings ***
Library           SeleniumLibrary
Suite Setup       Open Browser    http://localhost:8000/    Chrome
Suite Teardown    Close Browser

*** Variables ***
${Username}       noman
${Password}       12345

*** Test Cases ***
User Logout
    [Documentation]  Logout from the website
    [Tags]            logout, success
    Set Selenium Speed    1 second
    Click Element    link=Login
    Input Text       id=username       ${Username}
    Input Text       id=password       ${Password}
    Click Element    xpath=//input[@type='submit']
    Wait Until Page Contains    Welcome noman
    Click Element    link=Logout
    Wait Until Page Contains    Login
    Capture Page Screenshot