Feature: Authentication

  Scenario: Successful Login
    Given there is a user email "joseph.yao.ruozhou@gmail.com" and password "123456"
    When login with user email "joseph.yao.ruozhou@gmail.com" and password "123456"
    Then login successfully

  Scenario: Login Failed
    Given there is a user email "joseph.yao.ruozhou@gmail.com" and password "123456"
    When login with user email "joseph.yao.ruozhou@gmail.com" and password "wrong_password"
    Then login failed

  @ignore_ios @ignore_angular @ignore_react @ignore_wepy
  Scenario: Both email and password may not be empty
    When login with user email "" and password ""
    Then there is an error message for empty email
    And there is an error message for empty password
