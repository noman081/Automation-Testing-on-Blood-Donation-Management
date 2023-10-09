*** Settings ***
Library           SeleniumLibrary
Suite Setup       Open Browser    http://localhost:8000/    Chrome
Suite Teardown    Close Browser
Library           SeleniumLibrary
Suite Setup       Open Browser    http://localhost:8000/    Chrome
Suite Teardown    Close Browser
*** Variables ***
${Username}          noman2
${FirstName}         Noman
${LastName}          Majumder
${Email}             noman2@example.com
${ContactNumber}     1234567890
${State}             California
${City}              Los Angeles
${Address}           123 Main Street
${Gender}            Male
${BloodGroup}        O-
${ProfilePhotoPath}  C:\\Users\\user\\Desktop\\Noman-2\\Automation\\images\\profile.jpg  # Provide the path to the photo
${DateOfBirth}       1990-01-01
${Password}          Password123

*** Test Cases ***
Register New User
    [Documentation]  Register a new user on the website
    [Tags]  registration
    Set Selenium Speed  0.5 second
    Click Element    link=Register As Donor
    # Fill in the registration form
    Input Text       name=username       ${Username}
    Input Text       name=first_name     ${FirstName}
    Input Text       name=last_name      ${LastName}
    Input Text       name=email          ${Email}
    Input Text       name=phone          ${ContactNumber}
    Input Text       name=state          ${State}
    Input Text       name=city           ${City}
    Input Text   name=address        ${Address}

    # Select gender (Use 'Select Radio Button By Value')
    Execute JavaScript  document.querySelector('input[name="gender"][value="${Gender}"]').click()


    # Select blood group
    Select From List by Label  name=blood_group  ${BloodGroup}


    # Upload profile photo
    Choose File  name=image  ${ProfilePhotoPath}

    # Set date of birth
    Input Text       name=date           ${DateOfBirth}

    # Set password and confirm password
    Input Text       name=password       ${Password}
    Input Text       name=confirm_password  ${Password}

    # Submit the registration form
    Click Button  xpath=//button[contains(text(),'Submit')]


