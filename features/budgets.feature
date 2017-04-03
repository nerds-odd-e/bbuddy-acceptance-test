@login @ignore_angular
Feature: Budgets

  Scenario: add budget
    When add budget as month 2017-01 and amount 1000
    Then you will see all budgets as below
      | month   | amount |
      | 2017-01 | 1000   |

