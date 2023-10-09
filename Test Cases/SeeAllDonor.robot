*** Settings ***
Library           SeleniumLibrary
Suite Setup       Open Browser    http://localhost:8000/    Chrome
Suite Teardown    Close Browser

*** Test Cases ***
Find O+ Donor Details
    [Documentation]  Find and view details of an O+ donor
    [Tags]            blood_group
    Set Selenium Speed    1 second

    # Wait for the page to load (You can replace this with an appropriate wait condition)
    Wait Until Page Contains Element    xpath=//h1[contains(text(),'Available Donors According To Blood Group')]

    # Find the link to view O+ donor details
    ${o_plus_link}    Get Element    xpath=//a[contains(text(),'View All Donors') and contains(@href, 'O+')]

    # Click the link if it's found
    Run Keyword If    "${o_plus_link}" != "None"    Click Element    ${o_plus_link}

    # Optionally, you can add verification steps to confirm successful navigation to the O+ donor details page

    # Capture a screenshot for verification
    Capture Page Screenshot
