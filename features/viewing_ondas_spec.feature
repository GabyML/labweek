Feature: viewing ondas
  In order to find new music
  As a user of QueOnda
  I want to see Ondas (links to music btw)

  Scenario: QueOnda homepage shows Ondas
    Given I am on the index page
    And I am logged in
    When I make an Onda
    Then I can see an Onda

