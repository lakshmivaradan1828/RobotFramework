*** Settings ***
Library           ExcelLibrary
Library           SeleniumLibrary
Library           AutoItLibrary
Library           DatabaseLibrary

*** Variables ***
@{Username}       eboadmin
@{URL}            http://segotn11232/procurement/WebDriver?ACT=Login&EID=1
@{EXCEL_FILE_NAME}
@{iColumnCount}
@{iRowCount}
${CellValue}      ${EMPTY}
${OUTPUT_DIR}     c:/RobotFramework/Results
${row}            ${EMPTY}
${index}          ${EMPTY}

*** Test Cases ***
ShoppingCart
    capture page screenshot
    Open Browser    @{URL}    chrome
    ${Window1Title}    Get Title
    Maximize Browser Window
    Input Text    name:username_input    @{Username}
    Capture Page Screenshot
    Input Password    name:j_password    password
    Click Button    name:Login
    Select From List    name:BID    Master
    Wait Until Element Is Enabled    xpath://a[text()='External Administration']
    Click Link    xpath://a[text()='External Administration']
    Sleep    10s
    

*** Keywords ***
Get Excel Data
    Open Excel    C:/RobotFramework/Data/TestData.xls    Sheet1
    ${iColumCount}    Get Column Count    Sheet1
    Log To Console    ${iColumCount}
    ${iRowCount}    Get Row Count    Sheet1
    Log To Console    ${iRowCount}
    : FOR    ${row}    IN RANGE    1    ${iRowCount}
    \    ${ColumnValue}    Read Cell Data By Coordinates    Sheet1    1    ${row}
    \    log    ${ColumnValue}
    \    Run Keyword If    {$ColumnValue} = = 'TCName'
    \    ${term_name}    Read Cell Data By Coordinates    Sheet1    1    ${row}
    \    log    ${term_name}

