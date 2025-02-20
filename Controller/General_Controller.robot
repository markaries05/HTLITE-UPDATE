*** Settings ***
Library    SeleniumLibrary
Library    XML
Variables    ../Data/Config.yml
Variables    ../Data/Login_Data.yml
Variables    ../Elements/Login_Elements.yml
Variables    ../Elements/Menu_Elements.yml



*** Variables ***

*** Keywords ***
Launch Browser Chrome
    Open Browser                         ${url}    ${browser1}
    Maximize Browser Window
    Set Browser Implicit Wait    10s
Launch Browser Firefox
    Open Browser                         ${url}    ${browser2}
    Maximize Browser Window
    Set Browser Implicit Wait    10s
Launch Browser Edge
    Open Browser                         ${url}    ${browser3}

    Maximize Browser Window
    Set Browser Implicit Wait    10s

Login
    Wait Until Element Is Visible        ${username_field}
    Input Text                           ${username_field}    ${username}
    Input Password                       ${password_field}    ${password}
    Click Button                         ${signIn_button}
    Click Element                        ${accept_term}
    Click Button                         ${term_continue_btn}
    Wait Until Element Is Visible        ${dashboard}
Access_digitized_signature
    Click Element                        ${settings_dropdown}
    Click Element                        ${upload_dig_btn_page} 
    Wait Until Element Is Visible        xpath://div[@class='wrapper wrapper-content animated fadeIn']

Acess_change_pass
    Click Element                        ${settings_dropdown}
    Click Element                        ${change_pass_btn_page}
    Wait Until Element Is Visible        xpath://div[@class='wrapper wrapper-content animated fadeIn']
    
Log out
    Click Image                          ${logout_button}



Set TestRail Property
    [Arguments]    ${key}    ${value}
    Set Test Documentation    ${\n}- ${key}: ${value}    append=True
Take Screenshot And Report
    ${path} =    Capture Page Screenshot    filename=Screenshot-{index}.png
    Set TestRail Property    testrail_attachment    ${path}

Close Test Browser
    Run Keyword If    '${TEST_STATUS}' != 'PASS'    Take Screenshot And Report
    Close Browser
   