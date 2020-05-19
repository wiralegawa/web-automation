@register
Feature: User should be able to register

Background:
    When init browser
    And navigate to "https://www.amazon.com/"

@register_success
Scenario: register success
    Given I navigate to login page
    Then I navigate to register page
    When I register with name "haekal" email "ujiperang+2@gmail.com" password "passpass1234" re-enter password "passpass1234"
    Then I See OTP Registration Displayed
    Then quit this test

@register_fail
Scenario: invalid register
    Given I navigate to login page
    Then I navigate to register page
    When I register with name "haekal" email "ujiperang@gmail" password "passpass1234" re-enter password "passpass1234"
    Then I see Email is Invalid
    Then quit this test