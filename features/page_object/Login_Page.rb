require 'rubygems'
require 'rspec'
require 'selenium-webdriver'
require 'test/unit'
require_relative './Abstract_Page.rb'
include Test::Unit::Assertions

class LoginPage < AbstractPage
        def initialize (driver)
                super(driver)
        end

        def loginPage_loginWith (username, password)
                wait = Selenium::WebDriver::Wait.new(:timeout => 15)

                username.gsub(/\n\s+/, " ")
                password.gsub(/\n\s+/, " ")
                #Enter User name
                tfUsername = wait.until {
                        element = @@webDriver.find_element(:id, "ap_email")
                        element if element.displayed?
                }
                tfUsername.send_keys username
                btnContinueLogin = wait.until {
                        element = @@webDriver.find_element(:id, "continue")
                        element if element.displayed?
                }
                btnContinueLogin.click

                #Enter Password
                tfPassword = wait.until {
                        element = @@webDriver.find_element(:id, "ap_password")
                        element if element.displayed?
                }
                tfPassword.send_keys password
                btnSubmitPassword = wait.until {
                        element = @@webDriver.find_element(:id, "signInSubmit")
                        element if element.displayed?
                }
                btnSubmitPassword.click

                wait = Selenium::WebDriver::Wait.new(:timeout => 50)

                wait.until{
                        element = @@webDriver.find_element(:id, "continue")
                        element if element.displayed?
                }

                assert(@@webDriver.find_element(:id => "continue"))
        end
end