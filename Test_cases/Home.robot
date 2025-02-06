*** Settings ***
Name    HRLITE HOME
Library        SeleniumLibrary
Library        OperatingSystem
Library    AllureLibrary
Library    Screenshot
Variables    ../Data/Config.yml
Variables    ../Elements/Login_Elements.yml
Variables    ../Elements/Menu_Elements.yml
Variables    ../Data/Login_Data.yml
Resource    ../Controller/General_Controller.robot



Test Setup    Launch Browser    
Test Teardown    Close All Browsers

*** Variables ***
${screenshot_path}
${screenfilename}    
*** Test Cases ***

T57324
    [Documentation]    **Able to view the Featured Employee**
    Login
    Wait Until Element Is Visible    ${featured_emp}
   ${screenshot_path1}=    Capture Page Screenshot    Test_cases/test_result/feature_employee.png
    Attach File    ${screenshot_path1}    feature_employee.png    image/png
T57325
    [Documentation]    **Able to view the Announcement and Events**
    Login
    Wait Until Element Is Visible    ${announcement}
    ${screenshot_path1}=    Capture Page Screenshot    Test_cases/test_result/announcement.png
    Attach File    ${screenshot_path1}    announcement.png    image/png
T57326
    [Documentation]    **Able to hide Announcement and Events using the drop-down button**
    [Tags]    Unfinish
    Login
    Wait Until Element Is Visible    ${announcement}
    Click Element    ${announcement_dropdown}
    ${screenshot_path1}=    Capture Page Screenshot    Test_cases/test_result/announcement_bhide.png
    Attach File    ${screenshot_path1}    announcement_bhide.png    image/png
    Sleep    1s
    ${screenshot_path1}=    Capture Page Screenshot    Test_cases/test_result/announcement_hide.png
    Attach File    ${screenshot_path1}    announcement_hide.png    image/png
    
T57327
    [Documentation]    **Able to click the navigation bar button**
    Login
    Click Element    ${nav_bar_btn}
    ${screenshot_path1}=    Capture Page Screenshot    Test_cases/test_result/nav_bar.png
    Attach File    ${screenshot_path1}    nav_bar.png    image/png
    Sleep    1s
    ${screenshot_path1}=    Capture Page Screenshot    Test_cases/test_result/nav_ubar.png
    Attach File    ${screenshot_path1}    nav_ubar.png    image/png
T57336
    [Documentation]    **Able to hide 'My Leave Credits' using the drop-down button**
    Login
    Click Element    ${my_leave_cred_dropdown}
     ${screenshot_path1}=    Capture Page Screenshot    Test_cases/test_result/nav_bar.png
    Attach File    ${screenshot_path1}    nav_bar.png    image/png
    Sleep    1s
    ${screenshot_path1}=    Capture Page Screenshot    Test_cases/test_result/nav_ubar.png
    Attach File    ${screenshot_path1}    nav_ubar.png    image/png
    
    

    