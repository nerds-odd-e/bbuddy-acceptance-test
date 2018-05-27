@login
Feature: Accounts

  Scenario: show all accounts
    Given exists the following accounts
      | name | balance |
      | CMB  | 1000    |
      | HSBC | 0       |
    When show all accounts
    Then you will see all accounts as below
      | name | balance |
      | CMB  | 1000    |
      | HSBC | 0       |

  @ignore_ios
  Scenario: add account
    When add account as name CMB and balance 1000
    Then you will see all accounts as below
      | name | balance |
      | CMB  | 1000    |

  @ignore_angular @ignore_react
  Scenario: edit account
    Given exists the following accounts
      | name | balance |
      | CMB  | 1000    |
    When edit account as name HSBC and balance 2000
    Then you will see all accounts as below
      | name | balance |
      | HSBC | 2000    |

  @ignore_angular @ignore_react
  Scenario: delete account
    Given exists the following accounts
      | name          | balance |
      | Shanghai Bank | 1000    |
    When delete this account
    Then you will not see it in the list

  @ignore_ios @ignore_angular @ignore_react @ignore_wepy @ignore_android
  Scenario: name may not be empty
    When add account with empty name
    Then there is an error message for empty name

  @ignore_ios @ignore_angular @ignore_react @ignore_wepy @ignore_android
  Scenario: name may not be longer than 50 characters
    When add account as name toooooooooooooooooooooooooooooooooooooooooooooolong and balance 100
    Then there is an error message for name can't be longer than 50
