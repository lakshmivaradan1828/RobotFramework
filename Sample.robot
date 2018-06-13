*** Settings ***
Library           SeleniumLibrary
Library           AutoItLibrary
Library           DatabaseLibrary
Library           ExcelLibrary

*** Variables ***
@{Username}       eboadmin
@{URL}      http://segotn11232/procurement/WebDriver?ACT=Login&EID=1&KIU=73e122e95387a85ffcaec373e2b18683

*** Test Cases ***
ShoppingCart
    Open Browser    @{URL}      chrome
    Input Text    name:username_input    @{Username}
    Capture Page Screenshot
    Input Password    name:j_password    password
    Click Button    name:Login
    Select From List    name:BID    Master
    Click Link    xpath://a[text()='New Shopping Cart']
    Wait Until Element Is Visible    //frame[@name='main']
    Select Frame    //frame[@name='main']
    Input Text    xpath://input[@name='TXT_SUPPLIER' and @id='supplier']    ÅF Industriteknik
    Click Button    id:btnFind
    Select Frame    //frame[@name='main']
    Click Image    alt:'Add Item to Shopping Cart'[1]
