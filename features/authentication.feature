Feature: Authentication

  Scenario: Successful Login
    Given there is a user email "joseph.yao.ruozhou@gmail.com" and password is "123456"
    When login with user email "joseph.yao.ruozhou@gmail.com" and password "123456"
    Then login successfully
