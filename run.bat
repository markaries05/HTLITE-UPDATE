CD C:\project\HRLITE\Test_cases
pabot --processes 4 --listener allure_robotframework:test_result/allure-results --outputdir test_result Login.robot
CD C:\project\HRLITE\Test_cases\test_result
allure generate allure-results --clean -o allure-report