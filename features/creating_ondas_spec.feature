Feature: creating Ondas
  In order to share my music
  As a QueOnda user
  I want to create Ondas

  Scenario: creating ondas when not logged in
    Given that I am not logged in
    When I make an Onda
    Then I should see "You must be logged in to post an Onda" 