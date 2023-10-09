*** Settings ***
Library           SeleniumLibrary
Suite Setup       Open Browser    http://localhost:8000/    Chrome
Suite Teardown    Close Browser

*** Variables ***
${Username}       noman
${Password}       12345
${WrongUsername}  nomana
${WrongPassword}  12345

*** Test Cases ***
User Login
    [Documentation]  Login to the website with correct credentials
    [Tags]            login, success
    Set Selenium Speed    1 second
    Click Element    link=Login
    Input Text       id=username       ${Username}
    Input Text       id=password       ${Password}
    Click Element    xpath=//input[@type='submit']
    Wait Until Page Contains    Welcome noman
    Capture Page Screenshot
    Click Element    link=Logout

User Login With Wrong Username
    [Documentation]  Attempt to log in with a wrong username
    [Tags]  login, negative
    Set Selenium Speed  1 second
    Click Element    link=Login
    Wait Until Page Contains Element  id=username
    Input Text  id=username  ${WrongUsername}  # Provide a wrong username
    Input Text  id=password  ${Password}  # Provide a correct password
    Click Element  xpath=//input[@type='submit']  # Click the login button
    Page Should Not Contain  Welcome  # Assert that "Welcome" is not found on the page
    Capture Page Screenshot



