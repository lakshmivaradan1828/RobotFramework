*** Settings ***
Library           SeleniumLibrary

*** Variables ***
@{URL}            http://www.google.com

*** Test Cases ***
Sample
    Open Browser    @{URL}    chrome
