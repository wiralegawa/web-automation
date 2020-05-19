@login
Feature: User Should be able to login

  Background:
    When init browser
    And navigate to "https://www.amazon.com/"

  @login_success
  Scenario: login success
    Given I navigate to login page
    When I login with username "ujiperang@gmail.com" password "passpass1234"
    Then I see Login Success
    Then quit this test

  @fail_login
  Scenario: fail login
    Given I navigate to login page
    When I login with invalid email format "ujiperang@gmail"
    Then I see Login Failed with Error Message
    Then quit this test