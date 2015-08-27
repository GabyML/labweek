Feature: viewing ondas
  In order to find new music
  As a user of QueOnda
  I want to see Ondas (links to music btw)

  Scenario: QueOnda homepage shows Ondas
    Given I am on the index page
    And I am logged in
    When I make an Onda
    Then I can see an Onda

  Scenario: can see which user created each Onda
    Given Sally creates an Onda
    And I am on the index page
    Then I should see "Sally:"

  Scenario: can see user's profile emoji
    Given Sally creates an Onda
    And I am on the index page
    Then I should see "👸"

  Scenario: My Ondas link to the song
    Given Sally creates an Onda
    When I click on "Rola"
    Then I should visit "https://www.youtube.com/watch?v=dQw4w9WgXcQ"



