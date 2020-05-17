require 'rubygems'
require 'rspec'
require 'selenium-webdriver'
require_relative './Abstract_Page.rb'

class HomePage < AbstractPage
        # constuctor
        def initialize (driver)
                super(driver)
        end

        def goToLoginPage
                @@webDriver.action.click(@@webDriver.find_element(:id => 'nav-link-accountList')).perform
                wait = Selenium::WebDriver::Wait.new(:timeout => 2)
                wait.until { @@webDriver.find_element(:id, 'ap_email').displayed? }
        end
end