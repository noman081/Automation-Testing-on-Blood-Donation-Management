*** Settings ***
Library           SeleniumLibrary
Suite Setup       Open Browser    http://localhost:8000/    Chrome
Suite Teardown    Close Browser

*** Test Cases ***
User SeeAllRequest
    [Documentation]  See all the blood requests
    [Tags]            SeeAllRequest, success
    Set Selenium Speed    1 second
    Click Element    link=See All Request
    Wait Until Page Contains    All Blood Requests
    Capture Page Screenshot