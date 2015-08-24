Feature: logging in to QueOnda
  In order to share music
  As a person who has signed up to QueOnda
  I want to log in to QueOnda

  Scenario: logging in to QueOnda
    Given I visit index page
    And I have an account with username "Dilbert" and password "1234"
    When I fill in "return_username" with "Dilbert"
    And I fill in "return_password" with "1234"
    And I click the "Log In" button
    Then I should see "Welcome, Dilbert"
