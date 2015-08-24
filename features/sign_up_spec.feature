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
    When I fill in "username" with "Bob"
    And I click the "Submit" button
    Then I should see "Welcome Bob"
