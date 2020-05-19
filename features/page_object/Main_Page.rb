require 'rubygems'
require 'rspec'
require 'selenium-webdriver'
require_relative './Abstract_Page.rb'
require_relative './Login_Page.rb'
require_relative './Home_Page.rb'
require_relative './Register_Page.rb'

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
          @@objClsHomePage.goToLoginPage
          return LoginPage.new @@webDriver
        end

        def loginWith (username,password)
          username.gsub(/\n\s+/, " ")
          password.gsub(/\n\s+/, " ")
          @@objLoginPage.loginPage_loginWith username, password
        end

        def assertSuccessLogin
          @@objLoginPage.assertSuccessLogin
        end

        def failLoginWith (username)
          username.gsub(/\n\s+/, " ")
          @@objLoginPage.failedLogin username
        end

        def assertInvalidLogin
          @@objLoginPage.assertFailLogin
        end

        def navigateToRegisterPage
          @@objLoginPage.goToRegisterPage
          return RegisterPage.new @@webDriver
        end

        def registerWith (name, email, password, reEnterPassword)
          name.gsub(/\n\s+/, " ")
          email.gsub(/\n\s+/, " ")
          password.gsub(/\n\s+/, " ")
          reEnterPassword.gsub(/\n\s+/, " ")
          @@objRegisterPage.registerPageWith name, email, password, reEnterPassword
        end

        def assertOTPRegistration
          @@objRegisterPage.assertOTPRegister
        end

        def assertInvalidEmailReg
          @@objRegisterPage.assertInvalidEmailRegister
        end
end
