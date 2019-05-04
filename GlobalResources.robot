*** Settings ***
Library           Selenium2Library
Resource          GlobalVariables.robot

*** Keywords ***
Open Instance
    [Arguments]    ${instanceName}
    Run Keyword If    '${instanceName.lower()}'=='test'    Open Browser    ${TEST_URL}    ${BROWSER}
    Run Keyword If    '${instanceName.lower()}'=='archive'    Open Browser    ${ARCHIVE_URL}    ${BROWSER}
    Run Keyword If    '${instanceName.lower()}'=='dev'    Open Browser    ${DEV_URL}    ${BROWSER}
    Maximize Browser Window

Login SN
    [Arguments]    ${username}    ${password}
    Input Text    id=user_name    ${username}
    Input Password    id=user_password    ${password}
    Click Button    id=sysverb_login

Impersonate As
    [Arguments]    ${username}
    [Documentation]    Impersonate as a different user in ServiceNow.
    Click Button    id=user_info_dropdown
    Click Link    Impersonate User
    Click Element    id=select2-chosen-2
    Input Text    id=s2id_autogen2_search    ${username}
    Sleep    2s
    Press Key    id=s2id_autogen2_search    \\13
    Sleep    2s

Search In Navigation
    [Arguments]    ${text}
    Input Text    id=filter    ${text}

Press Enter
    [Arguments]    ${locator}
    Press Key    ${locator}    \\13

Reference Input
    [Arguments]    ${locator}    ${value}
    Input Text    ${locator}    ${value}
    Press Enter    ${locator}

Search In List View
    [Arguments]    ${filterBy}    ${query}
    ${locator}    Set Variable    xpath=//*[@id='task_table']//input[contains(@aria-label,'Search
    ${locator}    Catenate    SEPARATOR=    ${locator}    ${SPACE}    ${filterBy.lower()}    ')]
    Input Text    ${locator}    ${query}
    Press Enter    ${locator}

Select Main Frame
    Select Frame    id=gsft_main

StartTest
    Open Browser    https://dev59107.service-now.com/sp
