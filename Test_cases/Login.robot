*** Settings ***
Name    HRLITE LOGIN
Library        SeleniumLibrary
Library        OperatingSystem
Library    AllureLibrary

Variables    ../Data/Config.yml
Variables    ../Elements/Login_Elements.yml
Variables    ../Elements/Menu_Elements.yml
Variables    ../Data/Login_Data.yml
Resource    ../Controller/General_Controller.robot



Test Setup    Launch Browser    
Test Teardown    Close All Browsers



*** Test Cases ***

T57294
    [Documentation]    **Verify that user with valid credentials can login to the website**
    
    
    Wait Until Element Is Visible    ${username_field}
    # ${screenshot_path1}=    Capture Page Screenshot    Test_cases/test_result/test1.png
    # Attach File    ${screenshot_path1}    test1.png    image/png
    Input Text    ${username_field}    ${username}
    Input Password    ${password_field}    ${password}
    Click Button    ${signIn_button}
    Click Element    ${accept_term}
    Click Button    ${term_continue_btn}\
    # ${screenshot_path2}=    Capture Page Screenshot    Test_cases/test_result/test2.png
    # Attach File    ${screenshot_path2}    test2.png    image/png
    Wait Until Element Is Visible    ${dashboard}

# T57296
#     [Documentation]    **Verify that user with invalid credentials cannot login to the website**
    
#     Wait Until Element Is Visible    ${username_field}
#     Input Text    ${username_field}    test
#     Input Password    ${password_field}    test
#     Click Button    ${signIn_button}
#     Wait Until Element Is Visible    ${userPass_error}
# T57297
#     [Documentation]    **Verify that user must be able to hide/unhide password**
#     Wait Until Element Is Visible    ${username_field}
#     Input Text    ${username_field}    ${username}
#     Input Password    ${password_field}    ${password}
#     Click Element    ${unhide_toggle}   
#     ${text_type1}    Get Element Attribute   ${password_field}    type    
#     Should Be Equal As Strings    ${text_type1}    text
#     Sleep    3s
#     Click Element    ${unhide_toggle}   
#     ${text_type2}    Get Element Attribute  ${password_field}    type
#     Should Be Equal As Strings    ${text_type2}    password

# T57298
#     [Documentation]    **Verify that user must be able to logout from the website**
#     Wait Until Element Is Visible    ${username_field}
#     Input Text    ${username_field}    ${username}
#     Input Password    ${password_field}    ${password}
#     Click Button    ${signIn_button}
#     Click Element    ${accept_term}
#     Click Button    ${term_continue_btn}
#     Wait Until Element Is Visible    ${logout_button}
#     Click Element    ${logout_button}
#     Wait Until Element Is Visible    ${username_field}

# T57299
#     [Documentation]    **Verify that user must be able to reset his password** 
#     [Tags]    Unfinish
#     Wait Until Element Is Visible    ${username_field}
#     Input Text    ${username_field}    ${username}
#     Click Element    ${reset_btn}
#     Wait Until Element Is Visible    ${userPass_error} 
    
# T57300
#     [Documentation]    **Verify that user must not be able to login into the website until required fields are filled in.**
#     Wait Until Element Is Visible    ${username_field}
#     Click Button    ${signIn_button}
#     Capture Element Screenshot    xpath://div[@class='content']    ./screenshots/test1.png
#     Sleep    3
#     Input Text    ${username_field}    ${username}
#     Click Button    ${signIn_button}
#     Capture Element Screenshot   xpath://div[@class='content']    ./screenshots/test1.png




    