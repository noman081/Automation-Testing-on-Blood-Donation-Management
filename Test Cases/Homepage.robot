*** Settings ***
Library   SeleniumLibrary
Suite Setup  Go to Website
Suite Teardown  Close Browser
#Task Setup  Set Selenium Speed   0.2 seconds

*** Variables ***
${URL}   http://127.0.0.1:8000/
${Browser}  chrome


*** Test Cases ***
HomePage
    page should contain   TechVidvan Blood Donation System


*** Keywords ***

Go to Website
    [Documentation]  This test case verify user is able to open the URL
    Open Browser  ${URL}    ${Browser}






