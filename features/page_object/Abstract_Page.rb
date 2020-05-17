require "rspec"
require "rubygems"
require "selenium-webdriver"

class AbstractPage
        # constuctor
        def initialize (browser_driver)
                @@webDriver =  browser_driver
        end

        def navigateToHomePage (homePageUrl)
                begin
                        @@webDriver.manage.window.maximize
                        @@webDriver.navigate.to homePageUrl
                        waitLocal2= Selenium::WebDriver::Wait.new(:timeout => 2) # seconds
                        waitLocal2.until { @@webDriver.find_element(:class_name, "nav-logo").displayed? }
                rescue => exception
                        puts "An error of type #{exception.class} happened, message is #{exception.message}"
                        return nil
                end
        end

        # get title
        def getTitle
                return @@webDriver.title
        end

        # quit driver
        def quitDriver
                @@webDriver.quit
        end
end