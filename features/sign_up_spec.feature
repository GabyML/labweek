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
    And I should see "Bio"
    And I should see "Choose your emoji"

  Scenario: completing signup
    Given I visit the sign up page
    When I fill in "username" with "Gerald"
    And I fill in "email" with "gerald@email.com"
    And I fill in "password" with "1234"
    And I fill in "password_confirmation" with "1234"
    And I click the "Submit" button
    Then I should see "Welcome, Gerald"

  Scenario: signing up with non matching password & confirmation
    Given I visit the sign up page
    When I fill in "password" with "1234"
    And I fill in "password_confirmation" with "12345"
    And I click the "Submit" button
    Then I should see "Password does not match the confirmation"

  Scenario: signing up without a password
    Given I visit the sign up page
    When I fill in "username" with "name"
    And I fill in "email" with "name@mail.com"
    And I fill in "password" with ""
    And I click the "Submit" button
    Then I should see "Password must not be blank"

  Scenario: signing up without an email
    Given I visit the sign up page
    When I fill in "username" with "name"
    And I fill in "password" with "1234"
    And I fill in "password_confirmation" with "1234"
    And I click the "Submit" button
    Then I should see "Email must not be blank"

  Scenario: signing up without a username
    Given I visit the sign up page
    When I fill in "email" with "name@email.com"
    And I fill in "password" with "1234"
    And I fill in "password_confirmation" with "1234"
    And I click the "Submit" button
    Then I should see "Username must not be blank"

  Scenario: signing up with a username that's taken
    Given I visit the sign up page
    And there is already a user with username "Sally"
    When I fill in "username" with "Sally"
    And I fill in "email" with "sally@email.com"
    And I fill in "password" with "1234"
    And I fill in "password_confirmation" with "1234"
    And I click the "Submit" button
    Then I should see "Username is already taken"

  Scenario: signing up with an email that's taken
    Given I visit the sign up page
    And there is already a user with email "sally@email.com"
    When I fill in "username" with "Sally"
    And I fill in "email" with "sally@email.com"
    And I fill in "password" with "1234"
    And I fill in "password_confirmation" with "1234"
    And I click the "Submit" button
    Then I should see "Email is already taken"
