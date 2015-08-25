Feature: Password reset
  In order to access my account
  As a QueOnda user who has forgotten my password
  I want to be able to reset my password

  Scenario: getting to the password recovery screen
    Given that I am not logged in
    When I click the "Forgotten password?" button
    Then I should see "Please enter your email address"

  Scenario: requesting password reset
    Given there is already a user with email "dmitri@email.com"
    And that I am not logged in
    And I visit the request_password_reset page
    When I fill in "email" with "dmitri@email.com"
    And I click the "Send recovery email" button
    Then I should see "Check dmitri@email.com"
