require 'rubygems'
require 'rspec'
require 'selenium-webdriver'
require_relative '../page_object/Main_Page.rb'
require_relative '../page_object/Abstract_Page.rb'
require_relative '../page_object/Home_Page.rb'

@@webDriver             = nil
@@objMainPage           = MainClass.new
@@objAbstractPage       = nil
@@objLoginPage          = nil
@@objClsHomePage        = nil

When("init browser") do
 puts 'Open Browser'
 @@objMainPage.initBrowser('chrome')
end

When("navigate to {string}") do |homePageUrl|
 homePageUrl.gsub(/\n\s+/, " ")
 puts 'Navigate To ', homePageUrl
 @@objClsHomePage = @@objMainPage.navigateToHomePage homePageUrl
end

Then("quit this test") do
 puts 'I Quit This Test'
 @@objMainPage.quitTest
end

Given("I navigate to login page") do
 @@objLoginPage = @@objMainPage.navigateToLoginPage
end

When("I login with username {string} password {string}") do |username, password|
 puts 'login with username ' , username , ' passwrod ' , password
 @@objMainPage.loginWith username, password
end

When("I login with invalid email format {string}") do |username|
 puts 'invalid login with ' , username
 @@objMainPage.failLoginWith username
end

Then("I see Login Success") do
 puts 'Assert Success Login'
 @@objMainPage.assertSuccessLogin
end

Then("I see Login Failed with Error Message") do
 puts 'Assert Fail Login'
 @@objMainPage.assertInvalidLogin
end