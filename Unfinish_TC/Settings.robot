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
Resource    ../Controller/General_Controller.robot

Test Setup    Launch Browser Chrome
Test Teardown    Close All Browsers
*** Variables ***
${screenshot_path}
*** Test Cases ***
T57301
    [Documentation]    **Verify that user is able to access the Settings Link**
    
    Login
    Click Element                        ${settings_dropdown}
    Sleep    1s
    ${screenshot_path}=                  Capture Page Screenshot    Unfinish_TC/settings_dd.png
    Attach File                          ${screenshot_path}    settings_dd.png    image/png
    Wait Until Element Is Visible        ${settings_dd_menu}
    
# T57303 
#     [Documentation]    **Verify that user can able to upload digitized signature**
    
#     Login
#     Click Element                        ${settings_dropdown}
#     Wait Until Element Is Visible    xpath://a[@href='/index.php?r=pmis/er/imageSignature']
#     Click Element    xpath://a[@href='/index.php?r=pmis/er/imageSignature']

# T57304
#     [Documentation]    **Verify that user can able to upload digitized signature**
    
#     Login
#     Click Element                        ${settings_dropdown}
#     Wait Until Element Is Visible    xpath://a[@href='/index.php?r=pmis/er/imageSignature']
#     Click Element    xpath://a[@href='/index.php?r=pmis/er/imageSignature']



    



*** Keywords ***
Take Custom Screenshot On Failure
    Run Keyword If    '${TEST_STATUS}' == 'FAIL'    Capture Custom Screenshot

Capture Custom Screenshot
    ${timestamp}=    Get Current Date    result_format=%Y%m%d_%H%M%S
    ${screenshot_filename}=    Set Variable    ./screeshots/test_fail_${timestamp}.png
    Capture Page Screenshot    ${screenshot_filename}
    Log    Screenshot captured at: ${screenshot_filename}
    


