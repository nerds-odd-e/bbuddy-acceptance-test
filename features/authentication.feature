Feature: Authentication

  Scenario: Successful Login
    Given there is a user email "joseph.yao.ruozhou@gmail.com" and password "123456"
    When login with user email "joseph.yao.ruozhou@gmail.com" and password "123456"
    Then login successfully

  Scenario: Login Failed
    Given there is a user email "joseph.yao.ruozhou@gmail.com" and password "123456"
    When login with user email "joseph.yao.ruozhou@gmail.com" and password "wrong_password"
    Then login failed
