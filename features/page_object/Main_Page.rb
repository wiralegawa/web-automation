require 'rubygems'
require 'rspec'
require 'selenium-webdriver'
require_relative './Abstract_Page.rb'
require_relative './Login_Page.rb'
require_relative './Home_Page.rb'

class MainClass
        def initBrowser (browserType)
                browserType.gsub(/\n\s+/, " ")
                if browserType.include? 'firefox'
                  @@objAbstractPage = AbstractPage.new(Selenium::WebDriver.for(:firefox))
                elsif browserType.include? 'chrome'
                  @@objAbstractPage = AbstractPage.new(Selenium::WebDriver.for(:chrome, :switches => %w[ --disable-extensions ]))
                end
        end

        def quitTest
          @@objAbstractPage.quitDriver
        end

        def navigateToHomePage (homePageUrl)
          homePageUrl.gsub(/\n\s+/, " ")
          @@objAbstractPage.navigateToHomePage homePageUrl
          return HomePage.new @@webDriver
        end

        def navigateToLoginPage
          puts 'navigate to login page'
          @@objClsHomePage.goToLoginPage
          return LoginPage.new @@webDriver
        end

        def loginWith (username,password)
          username.gsub(/\n\s+/, " ")
          password.gsub(/\n\s+/, " ")
          puts 'Login with ', username , ' password ' , password
          @@objLoginPage.loginPage_loginWith username, password
        end
end
