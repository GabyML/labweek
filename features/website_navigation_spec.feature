Feature: website navigation
  In order to move around the website
  As a user of QueOnda
  I want there to be great UI

  Scenario: clicking the icon
    Given I am on the profile page of "Sally"
    When I click on "QUEONDA"
    Then I should be on path "/"
