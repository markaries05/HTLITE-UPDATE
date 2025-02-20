*** Settings ***
Name    HRLITE HOME CHROME
Library        SeleniumLibrary
Library        OperatingSystem
Library    AllureLibrary
Library    Screenshot
Variables    ../Data/Config.yml
Variables    ../Elements/Login_Elements.yml
Variables    ../Elements/Menu_Elements.yml
Variables    ../Data/Login_Data.yml
Resource    ../Controller/General_Controller.robot



Test Setup    Launch Browser Chrome
Test Teardown    Close All Browsers

*** Variables ***
${screenshot_path}
*** Test Cases ***

Able to view the Featured Employee
    [Documentation]    **Able to view the Featured Employee**
    Login
    Wait Until Element Is Visible        ${featured_emp}    timeout=10
   ${screenshot_path}=                  Capture Page Screenshot    Test_cases/test_result/test_screens/chrome/Cfeature_employee.png
    Attach File                          ${screenshot_path}    Cfeature_employee.png    image/png
Able to view the Announcement and Events
    [Documentation]    **Able to view the Announcement and Events**
    Login
    Wait Until Element Is Visible        ${announcement}    timeout=10
    ${screenshot_path}=                 Capture Page Screenshot    Test_cases/test_result/test_screens/chrome/Cannouncement.png
    Attach File                          ${screenshot_path}    Cannouncement.png    image/png
Able to hide Announcement and Events using the drop-down button
    [Documentation]    **Able to hide Announcement and Events using the drop-down button**
    [Tags]    Unfinish
    Login
    Wait Until Element Is Visible        ${announcement}    timeout=10
    Click Element                        ${announcement_dropdown}
    ${screenshot_path}=                 Capture Page Screenshot    Test_cases/test_result/test_screens/chrome/Cannouncement_bhide.png
    Attach File                          ${screenshot_path}    Cannouncement_bhide.png    image/png
    Sleep    1s
    ${screenshot_path}=                 Capture Page Screenshot    Test_cases/test_result/test_screens/chrome/Cannouncement_hide.png
    Attach File                          ${screenshot_path}    Cannouncement_hide.png    image/png
    
Able to click the navigation bar button
    [Documentation]    **Able to click the navigation bar button**
    Login
    ${screenshot_path}=                Capture Page Screenshot    Test_cases/test_result/test_screens/chrome/Fnav_bar.png
    Attach File                         ${screenshot_path}    Fnav_bar.png    image/png
    Wait Until Element Is Visible       ${nav_bar_btn}    timeout=10
    Click Element                       ${nav_bar_btn}
    Sleep    1s
    ${screenshot_path}=                Capture Page Screenshot    Test_cases/test_result/test_screens/chrome/Enav_ubar.png
    Attach File                         ${screenshot_path}    Enav_ubar.png    image/png
Able to hide 'My Leave Credits' using the drop-down button
    [Documentation]    **Able to hide 'My Leave Credits' using the drop-down button**
    Login
    Scroll Element Into View            ${scroll_down}         
    Sleep    1s
    ${screenshot_path}=                Capture Page Screenshot    Test_cases/test_result/test_screens/chrome/Cbleave_cred.png
    Attach File                         ${screenshot_path}    Cbleave_cred.png    image/png
    Wait Until Element Is Visible       ${my_leave_cred_dropdown}    timeout=10
    Click Element                       ${my_leave_cred_dropdown}
    Sleep    1s
    ${screenshot_path}=                Capture Page Screenshot    Test_cases/test_result/test_screens/chrome/Cleave_cred.png
    Attach File                         ${screenshot_path}    Cleave_cred.png    image/png
Able to view the 'My Leave Credits' dashboard
    [Documentation]    **Able to view the 'My Leave Credits' dashboard**
    Login
    Scroll Element Into View            ${scroll_down}
    Mouse Over                          ${leave_credit_mhover}
    Sleep    1s
    ${screenshot_path}=                Capture Page Screenshot    Test_cases/test_result/test_screens/chrome/Cleave_hover.png
    Attach File                         ${screenshot_path}    Cleave_hover.png    image/png
Able to view 'My Pending Applications' tab
    [Documentation]    **Able to view 'My Pending Applications' tab**
    Login
    Wait Until Element Is Visible       ${pending_leave_app}
    Mouse Over                          ${pending_leave_app}                         
    Sleep    1s
    ${screenshot_path}=                Capture Page Screenshot    Test_cases/test_result/test_screens/chrome/Cpending_hover.png
    Attach File                         ${screenshot_path}    Cpending_hover.png    image/png
Able to hide 'My Pending Application' dashboard
    [Documentation]    **Able to hide 'My Pending Application' dashboard** 
    Login
    Wait Until Element Is Visible       ${my_pending_app_dropdown}
    Click Element                       ${my_pending_app_dropdown}
    ${screenshot_path}=                Capture Page Screenshot    Test_cases/test_result/test_screens/chrome/Cpending_app_dd.png
    Attach File                         ${screenshot_path}    Cpending_app_dd.png    image/png
    Sleep    1s
    ${screenshot_path}=                Capture Page Screenshot    Test_cases/test_result/test_screens/chrome/Chpending_app_dd.png
    Attach File                         ${screenshot_path}    Chpending_app_dd.png    image/png