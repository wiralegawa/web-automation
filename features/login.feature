Feature: User Should be able to login

  Background:
    When init browser
    And navigate to "https://www.amazon.com/"

  Scenario: login Success
    Then quit this test