require 'rubygems'
require 'rspec'
require 'selenium-webdriver'
require_relative '../page_object/Main_Page.rb'
require_relative '../page_object/Abstract_Page.rb'
require_relative '../page_object/Home_Page.rb'

@@webDriver             = nil
@@objMainPage           = MainClass.new
@@objAbstractPage       = nil
@@obj_CurrentPage       = nil
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
