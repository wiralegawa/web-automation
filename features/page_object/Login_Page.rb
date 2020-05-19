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
        end

        def failedLogin(username)
                wait = Selenium::WebDriver::Wait.new(:timeout => 15)

                username.gsub(/\n\s+/, " ")

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
        end

        def goToRegisterPage
                @@webDriver.action.click(@@webDriver.find_element(:id => 'createAccountSubmit')).perform
                wait = Selenium::WebDriver::Wait.new(:timeout => 5)
                wait.until { @@webDriver.find_element(:id, 'ap_customer_name').displayed? }
        end

        def assertSuccessLogin
                wait = Selenium::WebDriver::Wait.new(:timeout => 10)
                begin
                        wait.until{
                                element = @@webDriver.find_element(:id, "continue")
                                element if element.displayed?
                        }
                        assert(@@webDriver.find_element(:id => "continue").displayed?)
                rescue => exception
                        puts 'Authentication Page not showed up !'
                end
        end

        def assertFailLogin
                Selenium::WebDriver::Wait.new(:timeout => 2)
                assert(@@webDriver.find_element(:class, "a-list-item").text.include?("We cannot find an account with that email address"))
        end
end