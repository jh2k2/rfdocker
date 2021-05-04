*** Settings ***
Documentation     A test suite for opening google page on firefox.
Resource          resource.robot

*** Test Cases ***
Test Case
    Open Browser  https://www.google.com
    Maximize Browser Window
    Title Should Be    Google