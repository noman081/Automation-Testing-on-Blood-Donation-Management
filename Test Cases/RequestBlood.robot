*** Settings ***
Library           SeleniumLibrary
Suite Setup       Open Browser    http://localhost:8000/    Chrome
Suite Teardown    Close Browser

*** Variables ***
${FullName}         John Doe
${Email}            johndoe@example.com
${ContactNumber}    1234567890
${State}            California
${City}             Los Angeles
${Address}          123 Main Street
${BloodGroup}       A+
${DateOfDonation}   2023-01-15

*** Test Cases ***
Submit Blood Request
    [Documentation]  Submit a blood request form
    [Tags]            blood_request
    Set Selenium Speed    1 second
    Click Element    link=Request For Blood
    # Fill in the blood request form
    Input Text       name=name          ${FullName}
    Input Text       name=email         ${Email}
    Input Text       name=phone         ${ContactNumber}
    Input Text       name=state         ${State}
    Input Text       name=city          ${City}
    Input Text       name=address       ${Address}

    # Select blood group
    Select From List by Label  name=blood_group  ${BloodGroup}

    # Set date of donation
    Input Text       name=date           ${DateOfDonation}

    # Submit the blood request form
    Click Button  xpath=//button[contains(text(),'Submit')]

    # Optionally, you can add verification steps to confirm successful submission

    # Capture a screenshot for verification
    Capture Page Screenshot
