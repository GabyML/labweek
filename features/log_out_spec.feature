Feature: logging out of QueOnda
  In order to protect the sanctity of my Ondas
  As a person who values his personal brand
  I want to log out of QueOnda

  xScenario: logging out of QueOnda
    Given I am logged in
    When I click the "Log Out" button
    Then I should see "Bye, loser"
