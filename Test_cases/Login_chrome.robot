*** Settings ***
Name    HRLITE LOGIN CHROME
Library        SeleniumLibrary
Library        OperatingSystem
Library        Collections
Library        AllureLibrary
Library        testrail
Variables    ../Data/Config.yml
Variables    ../Elements/Login_Elements.yml
Variables    ../Elements/Menu_Elements.yml
Variables    ../Data/Login_Data.yml
Resource    ../Controller/General_Controller.robot



Test Setup    Launch Browser Chrome
Test Teardown    Close Test Browser

*** Variables ***
${screenshot_path}

*** Test Cases ***

Verify that user with valid credentials can login to the    # TestRailID: C120
    [Tags]    TestRailID: C120
    Wait Until Element Is Visible        ${username_field}
    Input Text                           ${username_field}    ${username}
    Input Password                       ${password_field}    ${password}
    Take Screenshot And Report
    Click Button                         ${signIn_button}
    Click Element                        ${accept_term}
    Click Button                         ${term_continue_btn}    
    Wait Until Element Is Visible        ${dashboard}
    Sleep    1s 
    Take Screenshot And Report
Verify that user with invalid credentials cannot login to the website
    [Documentation]    **Verify that user with invalid credentials cannot login to the website**
    
    Wait Until Element Is Visible        ${username_field}
    Input Text                           ${username_field}    test
    Input Password                       ${password_field}    test
    Click Button                         ${signIn_button}
    Wait Until Element Is Visible        ${userPass_error}
Verify that user must be able to hide/unhide password
    [Documentation]    **Verify that user must be able to hide/unhide password**
    Wait Until Element Is Visible        ${username_field}
    Input Text                           ${username_field}    ${username}
    Input Password                       ${password_field}    ${password}
    Click Element                        ${unhide_toggle}   
    Click Element                        ${unhide_toggle}   
    
Verify that user must be able to logout from the website
    [Documentation]    **Verify that user must be able to logout from the website**
    Login
    Wait Until Element Is Visible        ${logout_button}
    Click Element                        ${logout_button}
    Wait Until Element Is Visible        ${username_field}
    Sleep    1s


Verify that user must be able to reset his password
    [Documentation]    **Verify that user must be able to reset his password** 
    [Tags]    Unfinish
    Wait Until Element Is Visible        ${username_field}
    Input Text                           ${username_field}    ${username}
    Click Element                        ${reset_btn}
    Wait Until Element Is Visible        ${reset_pass_mess} 

Verify that user must not be able to login into the website until required fields are filled in.
    [Documentation]    **Verify that user must not be able to login into the website until required fields are filled in.**
    Wait Until Element Is Visible        ${username_field}
    Click Button                         ${signIn_button}
    Input Text                           ${username_field}    ${username}
    Click Button                         ${signIn_button}
   
