*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem
Library    AllureLibrary
Library    DateTime
Library    testrail
Library    Screenshot

Variables    ../Data/Config.yml
Variables    ../Elements/Login_Elements.yml
Variables    ../Elements/Menu_Elements.yml
Variables    ../Data/Login_Data.yml
Variables    ../Elements/Settings_Elements.yml
Resource    ../Controller/General_Controller.robot

Test Setup    Launch Browser Chrome
Test Teardown    Close All Browsers
*** Variables ***
${screenshot_path}
${Upload_file_path}    signatire1.png

*** Test Cases ***
Verify that user is able to access the Settings Link
    [Documentation]    **Verify that user is able to access the Settings Link**
    
    Login
    Click Element                        ${settings_dropdown}
    Sleep    1s
    Wait Until Element Is Visible        ${settings_dd_menu}
    Sleep    1s
    Take Screenshot And Report
    
Verify that user can able to upload digitized signature 
    [Documentation]    **Verify that user can able to upload digitized signature**
    
    Login
    Access_digitized_signature
    ${IsElementVisible}=                 Run Keyword And Return Status    Element Should Be Visible   ${upload_dig_check_exist}
    Run Keyword If                       ${IsElementVisible}  Delete signature
    
    Click Button                         ${upload_dig_new_btn}
    Choose File                          ${upload_dig_choose_file}    ${CURDIR}${/}${Upload_file_path}
    Sleep    1s
    Take Screenshot And Report
    Click Button                         ${upload_dig_upload_btn}
    Wait Until Element Is Visible        ${upload_dig_success_notif}    timeout=10
    Click Element                        ${upload_dig_success_notif}
    Take Screenshot And Report

Verify that user can be able to view uploaded digitized signature
    [Documentation]    Verify that user can be able to view uploaded digitized signature 
    Login
    Access_digitized_signature
    Wait Until Element Is Visible        ${upload_dig_view_btn}    timeout=10
    Click Element                        ${upload_dig_view_btn}
    Sleep    1s
    Take Screenshot And Report
Verify if the system is able to display the 'Change Password' page
    [Documentation]    Verify if the system is able to display the 'Change Password' page
    Login
    Acess_change_pass
    Sleep    1s 
    Take Screenshot And Report
Verify Advanced Search is accessible
    [Documentation]    Verify Advanced Search is accessible
    Login
    Access_digitized_signature
    Click Button                        ${upload_dig_adv_btn}
    Input Text                          ${upload_dig_adv_input}    signatire1
    Sleep    1s
    Take Screenshot And Report
    Click Button                        xpath://button[@id='yw0']
    Sleep    1s
    Take Screenshot And Report
Verify that role types of the end-user are displayed
    [Documentation]    Verify that role types of the end-user are displayed
    Login
    Click Element                        ${settings_dropdown}
    Click Element                        ${user_role_btn}
    Wait Until Element Is Visible        ${user_role_modal}
    Take Screenshot And Report
Able to search for the Digitized Signature
    [Documentation]    Able to search for the Digitized Signature
    Login
    Access_digitized_signature
    Wait Until Element Is Visible        ${upload_dig_view_btn}    timeout=10
    Click Element                        ${upload_dig_view_btn}
    Sleep    1s
    Take Screenshot And Report
Able to search for Digitized Certificate
    [Documentation]    Able to search for Digitized Certificate
    Login
    Click Element                        ${settings_dropdown}
    Click Element                        ${upload_dig_cert_page}
    Sleep    1s
    Click Button                         xpath://button[@id='search-button'][1]
    Take Screenshot And Report
# test
#     Login
#     Access_digitized_signature
#     Sleep    1s
#     #select index in dropdown
#     Select From List By Index    xpath://select[@id='BaseErEmployeeImageSignature_pageSize']    4
#     Sleep    5s
# test2
#     Login
#     Click Element                        ${settings_dropdown}
#     click Element    xpath://a[@href='/index.php?r=pmis/er/pki/getExpiredCerts']
#     Sleep    5s
#     Close Window
#     Sleep    3s

*** Keywords ***
Delete signature
    Click Element    ${upload_dig_del_btn}
    Handle Alert    ACCEPT
    Click Element    ${upload_dig_success_notif}