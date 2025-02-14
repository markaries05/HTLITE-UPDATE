*** Settings ***
Name    HRLITE HOME EDGE
Library        SeleniumLibrary
Library        OperatingSystem
Library    AllureLibrary
Library    Screenshot
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

T57324
    [Documentation]    **Able to view the Featured Employee**
    Login
    Wait Until Element Is Visible        ${featured_emp}    timeout=10
   ${screenshot_path}=                  Capture Page Screenshot    Test_cases/test_result/test_screens/edge/Efeature_employee.png
    Attach File                          ${screenshot_path}    Efeature_employee.png    image/png
T57325
    [Documentation]    **Able to view the Announcement and Events**
    Login
    Wait Until Element Is Visible        ${announcement}    timeout=10
    ${screenshot_path}=                 Capture Page Screenshot    Test_cases/test_result/test_screens/edge/Eannouncement.png
    Attach File                          ${screenshot_path}    Eannouncement.png    image/png
T57326
    [Documentation]    **Able to hide Announcement and Events using the drop-down button**
    [Tags]    Unfinish
    Login
    Wait Until Element Is Visible        ${announcement}    timeout=10
    Click Element                        ${announcement_dropdown}
    ${screenshot_path}=                 Capture Page Screenshot    Test_cases/test_result/test_screens/edge/Eannouncement_bhide.png
    Attach File                          ${screenshot_path}    Eannouncement_bhide.png    image/png
    Sleep    1s
    ${screenshot_path}=                 Capture Page Screenshot    Test_cases/test_result/test_screens/edge/Eannouncement_hide.png
    Attach File                          ${screenshot_path}    Eannouncement_hide.png    image/png
    
T57327
    [Documentation]    **Able to click the navigation bar button**
    Login
    ${screenshot_path}=                Capture Page Screenshot    Test_cases/test_result/test_screens/edge/Enav_bar.png
    Attach File                         ${screenshot_path}    Enav_bar.png    image/png
    Wait Until Element Is Visible       ${nav_bar_btn}    timeout=10
    Click Element                       ${nav_bar_btn}
    Sleep    1s
    ${screenshot_path}=                Capture Page Screenshot    Test_cases/test_result/test_screens/edge/Enav_ubar.png
    Attach File                         ${screenshot_path}    Enav_ubar.png    image/png
T57336
    [Documentation]    **Able to hide 'My Leave Credits' using the drop-down button**
    Login
    Scroll Element Into View            ${scroll_down}         
    Sleep    1s
    ${screenshot_path}=                Capture Page Screenshot    Test_cases/test_result/test_screens/edge/Ebleave_cred.png
    Attach File                         ${screenshot_path}    Ebleave_cred.png    image/png
    Wait Until Element Is Visible       ${my_leave_cred_dropdown}    timeout=10
    Click Element                       ${my_leave_cred_dropdown}
    Sleep    1s
    ${screenshot_path}=                Capture Page Screenshot    Test_cases/test_result/test_screens/edge/Eleave_cred.png
    Attach File                         ${screenshot_path}    Eleave_cred.png    image/png
T57337
    [Documentation]    **Able to view the 'My Leave Credits' dashboard**
    Login
    Scroll Element Into View            ${scroll_down}
    Mouse Over                          ${leave_credit_mhover}
    Sleep    1s
    ${screenshot_path}=                Capture Page Screenshot    Test_cases/test_result/test_screens/edge/Eleave_hover.png
    Attach File                         ${screenshot_path}    Eleave_hover.png    image/png
T57353
    [Documentation]    **Able to view 'My Pending Applications' tab**
    Login
    Wait Until Element Is Visible       ${pending_leave_app}
    Mouse Over                          ${pending_leave_app}                         
    Sleep    1s
    ${screenshot_path}=                Capture Page Screenshot    Test_cases/test_result/test_screens/edge/Epending_hover.png
    Attach File                         ${screenshot_path}    Epending_hover.png    image/png
T57354
    [Documentation]    **Able to hide 'My Pending Application' dashboard** 
    Login
    Wait Until Element Is Visible       ${my_pending_app_dropdown}
    Click Element                       ${my_pending_app_dropdown}
    ${screenshot_path}=                Capture Page Screenshot    Test_cases/test_result/test_screens/edge/Epending_app_dd.png
    Attach File                         ${screenshot_path}    Cpending_app_dd.png    image/png
    Sleep    1s
    ${screenshot_path}=                Capture Page Screenshot    Test_cases/test_result/test_screens/edge/Ehpending_app_dd.png
    Attach File                         ${screenshot_path}    Ehpending_app_dd.png    image/png