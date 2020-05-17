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
