Feature: filtering ondas
  In order to find music i like
  As a music lover
  I want to be able to see other ondas by someone who's shared something i like

  Scenario: visiting a user page
    Given Sally creates an Onda
    And Billy creates an Onda
    And I visit index page
    When I click on "Sally"
    Then I should see "Sally's profile"
    But I should not see "Billy"

    Scenario: filtering by tags
    Given Sally creates an Onda
    And Billy creates an Onda
    And I visit index page
    When I click on "adamant"
    Then I should be on path "/onda/adamant"
    And I should see "adamant"
    But I should not see "NeverGonnaGiveYouUp"
