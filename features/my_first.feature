Feature: Login feature

  Scenario: As a valid user I can log into my app
    When I press "Sign in or register"
    Then I see "This field is required"
