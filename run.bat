@REM CD C:\project\HRLITE\Test_cases
@REM pabot --processes 4 --listener allure_robotframework:test_result/allure-results --outputdir test_result *.robot
@REM allure generate test_result/allure-results --clean -o test_result/allure-report
CD C:\project\pull-from-git\HRLITE-MAIN-REPO\Test_cases
pabot --processes 4 -d reports "Login_chrome.robot"
