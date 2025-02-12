*** Settings ***
Name    HRLITE LOGIN EDGE
Library        SeleniumLibrary
Library        OperatingSystem
Library    AllureLibrary

Variables    ../Data/Config.yml
Variables    ../Elements/Login_Elements.yml
Variables    ../Elements/Menu_Elements.yml
Variables    ../Data/Login_Data.yml
Resource    ../Controller/General_Controller.robot



Test Setup    Launch Browser Edge
Test Teardown    Close All Browsers

*** Variables ***
${screenshot_path}

*** Test Cases ***


T57294
    [Documentation]    **Verify that user with valid credentials can login to the website**
    Wait Until Element Is Visible        ${username_field}
    Input Text                           ${username_field}    ${username}
    Input Password                       ${password_field}    ${password}
    ${screenshot_path}=                  Capture Page Screenshot    Test_cases/test_result/test_screens/edge/ELog_page.png
    Attach File                          ${screenshot_path}    ELog_page.png    image/png
    Click Button                         ${signIn_button}
    Click Element                        ${accept_term}
    Click Button                         ${term_continue_btn}    
    Wait Until Element Is Visible        ${dashboard}

T57296
    [Documentation]    **Verify that user with invalid credentials cannot login to the website**
    
    Wait Until Element Is Visible        ${username_field}
    Input Text                           ${username_field}    test
    Input Password                       ${password_field}    test
    Click Button                         ${signIn_button}
    Wait Until Element Is Visible        ${userPass_error}
    Sleep    1s
    ${screenshot_path}=                  Capture Page Screenshot    Test_cases/test_result/test_screens/edge/Einvalid_cred.png
    Attach File                          ${screenshot_path}    Einvalid_cred.png    image/png
T57297
    [Documentation]    **Verify that user must be able to hide/unhide password**
    Wait Until Element Is Visible        ${username_field}
    Input Text                           ${username_field}    ${username}
    Input Password                       ${password_field}    ${password}
    Click Element                        ${unhide_toggle}   
    ${text_type1}                        Get Element Attribute   ${password_field}    type    
    Should Be Equal As Strings           ${text_type1}    text
    ${screenshot_path}=                  Capture Page Screenshot    Test_cases/test_result/test_screens/edge/Eunhide_pass.png
    Attach File                          ${screenshot_path}    Eunhide_pass.png    image/png
    Sleep    1s
    Click Element                        ${unhide_toggle}   
    ${text_type2}                        Get Element Attribute  ${password_field}    type
    Should Be Equal As Strings           ${text_type2}    password
    ${screenshot_path}=                  Capture Page Screenshot    Test_cases/test_result/test_screens/edge/Ehide_pass.png
    Attach File                          ${screenshot_path}    Ehide_pass.png    image/png
    Sleep    1s

T57298
    [Documentation]    **Verify that user must be able to logout from the website**
    Login
    Wait Until Element Is Visible        ${logout_button}
    ${screenshot_path}=                  Capture Page Screenshot    Test_cases/test_result/test_screens/edge/Ehome_page.png
    Attach File                          ${screenshot_path}    Ehome_page.png    image/png
    Click Element                        ${logout_button}
    Wait Until Element Is Visible        ${username_field}
    Sleep    1s
    ${screenshot_path}=                  Capture Page Screenshot    Test_cases/test_result/test_screens/edge/Elog_out.png
    Attach File                          ${screenshot_path}    Elog_out.png    image/png

T57299
    [Documentation]    **Verify that user must be able to reset his password** 
    [Tags]    Unfinish
    Wait Until Element Is Visible        ${username_field}
    Input Text                           ${username_field}    ${username}
    Click Element                        ${reset_btn}
    Wait Until Element Is Visible        ${reset_pass_mess} 
    Sleep    1s
    ${screenshot_path}=                  Capture Page Screenshot    Test_cases/test_result/test_screens/edge/Ereset_mess.png
    Attach File                          ${screenshot_path}    Ereset_mess.png    image/png
    
T57300
    [Documentation]    **Verify that user must not be able to login into the website until required fields are filled in.**
    Wait Until Element Is Visible        ${username_field}
    Click Button                         ${signIn_button}
    Sleep    1s
    ${screenshot_path}=                  Capture Page Screenshot    Test_cases/test_result/test_screens/edge/Eusername_err.png
    Attach File                          ${screenshot_path}    Eusername_err.png    image/png
    Input Text                           ${username_field}    ${username}
    Click Button                         ${signIn_button}
    Sleep    1s
    ${screenshot_path}=                  Capture Page Screenshot    Test_cases/test_result/test_screens/edge/Epass_err.png
    Attach File                          ${screenshot_path}    Epass_err.png    image/png



    