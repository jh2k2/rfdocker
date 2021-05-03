*** Settings ***
Documentation     A test suite for chrome page.
Resource          resource.robot

*** Test Cases ***
Test Case
    Open Browser  https://www.google.com ${BROWSER}
    Maximize Browser Window
    Title Should Be    Google