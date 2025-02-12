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

T57324
    [Documentation]    **Able to view the Featured Employee**
    Login
    Wait Until Element Is Visible        ${featured_emp}
   ${screenshot_path1}=                  Capture Page Screenshot    Test_cases/test_result/test_screens/chrome/Cfeature_employee.png
    Attach File                          ${screenshot_path1}    Cfeature_employee.png    image/png
T57325
    [Documentation]    **Able to view the Announcement and Events**
    Login
    Wait Until Element Is Visible        ${announcement}
    ${screenshot_path1}=                 Capture Page Screenshot    Test_cases/test_result/test_screens/chrome/Cannouncement.png
    Attach File                          ${screenshot_path1}    Cannouncement.png    image/png
T57326
    [Documentation]    **Able to hide Announcement and Events using the drop-down button**
    [Tags]    Unfinish
    Login
    Wait Until Element Is Visible        ${announcement}
    Click Element                        ${announcement_dropdown}
    ${screenshot_path1}=                 Capture Page Screenshot    Test_cases/test_result/test_screens/chrome/Cannouncement_bhide.png
    Attach File                          ${screenshot_path1}    Cannouncement_bhide.png    image/png
    Sleep    1s
    ${screenshot_path1}=                 Capture Page Screenshot    Test_cases/test_result/test_screens/chrome/Cannouncement_hide.png
    Attach File                          ${screenshot_path1}    Cannouncement_hide.png    image/png
    
T57327
    [Documentation]    **Able to click the navigation bar button**
    Login
    ${screenshot_path1}=                Capture Page Screenshot    Test_cases/test_result/test_screens/chrome/Fnav_bar.png
    Attach File                         ${screenshot_path1}    Fnav_bar.png    image/png
    Click Element                       ${nav_bar_btn}
    Sleep    1s
    ${screenshot_path1}=                Capture Page Screenshot    Test_cases/test_result/test_screens/chrome/Enav_ubar.png
    Attach File                         ${screenshot_path1}    Enav_ubar.png    image/png
T57336
    [Documentation]    **Able to hide 'My Leave Credits' using the drop-down button**
    Login
    Scroll Element Into View            xpath://a[@href='https://www.gov.ph/']
    Sleep    1s
    ${screenshot_path1}=                Capture Page Screenshot    Test_cases/test_result/test_screens/chrome/Cbleave_cred.png
    Attach File                         ${screenshot_path1}    Cbleave_cred.png    image/png
    Click Element                       ${my_leave_cred_dropdown}
    Sleep    1s
    ${screenshot_path1}=                Capture Page Screenshot    Test_cases/test_result/test_screens/chrome/Cleave_cred.png
    Attach File                         ${screenshot_path1}    Cleave_cred.png    image/png
T57337
    [Documentation]    **Able to view the 'My Leave Credits' dashboard**
    Login
    Scroll Element Into View            xpath://a[@href='https://www.gov.ph/']
    Mouse Over                          xpath://div[1][@class='col-md-4']//*[local-name() = 'path' and @fill='#8bbc21']
    Sleep    1s
    ${screenshot_path1}=                Capture Page Screenshot    Test_cases/test_result/test_screens/chrome/Cleave_hover.png
    Attach File                         ${screenshot_path1}    Cleave_hover.png    image/png
T57353
    [Documentation]    **Able to view 'My Pending Applications' tab**
    Login
    Mouse Over                          xpath://div[2][@class='col-md-4']//*[local-name() = 'path' and @fill='#2caffe']
    Sleep    1s
    ${screenshot_path1}=                Capture Page Screenshot    Test_cases/test_result/test_screens/chrome/Cpending_hover.png
    Attach File                         ${screenshot_path1}    Cpending_hover.png    image/png
T57354
    [Documentation]    **Able to hide 'My Pending Application' dashboard** 
    Login
    Click Element                       ${my_pending_app_dropdown}
    ${screenshot_path1}=                Capture Page Screenshot    Test_cases/test_result/test_screens/chrome/Cpending_app_dd.png
    Attach File                         ${screenshot_path1}    Cpending_app_dd.png    image/png
    Sleep    1s
    ${screenshot_path1}=                Capture Page Screenshot    Test_cases/test_result/test_screens/chrome/Chpending_app_dd.png
    Attach File                         ${screenshot_path1}    Chpending_app_dd.png    image/png