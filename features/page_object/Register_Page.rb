require 'rubygems'
require 'rspec'
require 'selenium-webdriver'
require 'test/unit'
require_relative './Abstract_Page.rb'
include Test::Unit::Assertions

class RegisterPage < AbstractPage

        def initialize (driver)
                super(driver)
        end

        def registerPageWith (name, email, password, reEnterPassword)
                wait = Selenium::WebDriver::Wait.new(:timeout => 15)

                name.gsub(/\n\s+/, " ")
                email.gsub(/\n\s+/, " ")
                password.gsub(/\n\s+/, " ")
                reEnterPassword.gsub(/\n\s+/, " ")

                tfName = wait.until {
                        element = @@webDriver.find_element(:id, "ap_customer_name")
                        element if element.displayed?
                }
                tfName.send_keys name

                tfEmail = wait.until {
                        element = @@webDriver.find_element(:id, "ap_email")
                        element if element.displayed?
                }
                tfEmail.send_keys email

                tfPassword = wait.until {
                        element = @@webDriver.find_element(:id, "ap_password")
                        element if element.displayed?
                }
                tfPassword.send_keys password

                tfReEnterPassword = wait.until {
                        element = @@webDriver.find_element(:id, "ap_password_check")
                        element if element.displayed?
                }
                tfReEnterPassword.send_keys password

                btnContinueRegister = wait.until {
                        element = @@webDriver.find_element(:id, "continue")
                        element if element.displayed?
                }
                btnContinueRegister.click
        end

        def assertOTPRegister
                wait = Selenium::WebDriver::Wait.new(:timeout => 10)
                begin
                        wait.until{
                                element = @@webDriver.find_element(:id, "a-autoid-0-announce")
                                element if element.displayed?
                        }
                        assert(@@webDriver.find_element(:class, "a-row a-spacing-small").text.include?("Verify email address"))
                rescue => exception
                        exception.message
                end
        end

        def assertInvalidEmailRegister
                Selenium::WebDriver::Wait.new(:timeout => 2)
                assert(@@webDriver.find_element(:class, "a-alert-content").text.include?("Enter a valid email address"))
        end
end