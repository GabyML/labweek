Feature: seeing all Ondas from one user
  In order to find music i like
  As a music lover
  I want to be able to see other ondas by someone who's shared something i like

  Scenario: visiting a user page
    Given Sally creates an Onda
    And Billy creates an Onda
    And I visit index page
    When I click on "Sally"
    Then I should see "Sally"
    But I should not see "Billy"
