*** Settings ***
Library    SeleniumLibrary
Variables    ../Data/Config.yml
Variables    ../Data/Login_Data.yml
Variables    ../Elements/Login_Elements.yml
Variables    ../Elements/Menu_Elements.yml


*** Variables ***




*** Keywords ***
Launch Browser
    Open Browser    ${url}    ${browser3}

    Maximize Browser Window
    Set Browser Implicit Wait    5s

Login
     Wait Until Element Is Visible    ${username_field}
    # ${screenshot_path1}=    Capture Page Screenshot    Test_cases/test_result/test1.png
    # Attach File    ${screenshot_path1}    test1.png    image/png
    Input Text    ${username_field}    ${username}
    Input Password    ${password_field}    ${password}
    Click Button    ${signIn_button}
    Click Element    ${accept_term}
    Click Button    ${term_continue_btn}
    # ${screenshot_path2}=    Capture Page Screenshot    Test_cases/test_result/test2.png
    # Attach File    ${screenshot_path2}    test2.png    image/png
    Wait Until Element Is Visible    ${dashboard}
  
Log out
    Click Image    ${logout_button}


    
