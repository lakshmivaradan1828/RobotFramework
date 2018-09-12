*** Settings ***
Library           Selenium2Library
Library           ExcelLibrary

*** Test Cases ***
TestBasic
    Open Browser    https://www.google.com   Chrome
    Maximize Browser Window
    Capture Page Screenshot
    Input Text    id:lst-ib    Robot Framework
    #Input Text    id:lst-ib    Automation Testing
    Capture Page Screenshot
    Press Key    name:btnK    \\13
    Click Link    xpath://*[@id="rso"]/div[1]/div/div[1]/div/div/h3/a
    Wait Until Element Is Visible    xpath://*[@id="navigation"]/li[1]/a    timeout=30
    Capture Page Screenshot
    Close Browser
