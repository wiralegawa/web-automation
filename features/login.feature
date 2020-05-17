Feature: User Should be able to login

  Background:
    When init browser
    And navigate to "https://www.amazon.com/"

  Scenario: login Success
    Given I navigate to login page
    When I login with username "ujiperang@gmail.com" password "passpass1234"
    Then quit this test