*** Settings ***
Library           SeleniumLibrary
Suite Setup       Open Browser    http://localhost:8000/    Chrome
Suite Teardown    Close Browser

*** Variables ***
${Username}       noman
${Password}       12345
${NewPhoneNumber}   0412345671

*** Test Cases ***
User EditNumber
    [Documentation]  Edit the contact number
    [Tags]            EditNumber, success
    Set Selenium Speed    1 second
    Click Element    link=Login
    Input Text       id=username       ${Username}
    Input Text       id=password       ${Password}
    Click Element    xpath=//input[@type='submit']
    Wait Until Page Contains    Welcome noman
    Click Element   link=Edit Profile

    # Input the new phone number
    Input Text       id=phone       ${NewPhoneNumber}

    # Submit the form
    Click Button     xpath=//button[contains(text(),'Update Profile')]

    # Handle the alert
    ${alert_text}=  Handle Alert
    Should Contain    ${alert_text}    Profile Updated

    # Optionally, you can add verification steps to confirm the successful update
    Wait Until Page Contains     0412345671
    # Capture a screenshot for verification
    Capture Page Screenshot

