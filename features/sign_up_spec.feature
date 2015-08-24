Feature: signing up to QueOnda
  In order to share music
  As a person who likes music
  I want to sign up to QueOnda

  Scenario: signing up to QueOnda
    Given I visit index page
    When I click the "Sign Up" button
    Then I should see "Choose a username"
    And I should see "Enter your email"
    And I should see "Choose a password"
    And I should see "Confirm your password"

  Scenario: completing signup
    Given I visit the sign up page
    When I fill in "username" with "Gerald"
    And I click the "Submit" button
    Then I should see "Welcome Gerald"

  Scenario: signing up with non matching password & confirmation
    Given I visit the sign up page
    When I fill in "password" with "1234"
    And I fill in "password_confirm" with "12345"
    And I click the "Submit" button
    Then I should see "Password does not match the confirmation"

  Scenario: signing up with a username that's taken
    Given there is already a user with username "Sally"
    And I visit the sign up page
    When I fill in "username" with "Sally"
    And I click the "Submit" button
    Then I should see "Username is already taken"

