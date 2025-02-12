CD C:\project\HRLITE\Test_cases
pabot --processes 4 --listener allure_robotframework:test_result/allure-results --outputdir test_result *.robot
allure generate test_result/allure-results --clean -o test_result/allure-report