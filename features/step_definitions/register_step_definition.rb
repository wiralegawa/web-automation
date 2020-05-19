require 'rubygems'
require 'rspec'
require 'selenium-webdriver'
require_relative '../page_object/Main_Page.rb'
require_relative '../page_object/Abstract_Page.rb'
require_relative '../page_object/Home_Page.rb'

@@webDriver             = nil
@@objMainPage           = MainClass.new
@@objAbstractPage       = nil
@@objRegisterPage       = nil

Given("I navigate to register page") do
 puts 'I go to Register page'
 @@objRegisterPage = @@objMainPage.navigateToRegisterPage
end
       
When("I register with name {string} email {string} password {string} re-enter password {string}") do |name, email, password, reEnterPass|
 puts 'Register with name ' , name , ' email ' , email , ' password ' , password , ' re-enter password ', reEnterPass
 @@objMainPage.registerWith name, email, password, reEnterPass
end

Then("I See OTP Registration Displayed") do
 puts 'I see OTP Displayed'
 @@objMainPage.assertOTPRegistration
end

Then("I see Email is Invalid") do
 puts 'I See invalid email alert displayed'
 @objMainPage.assertInvalidEmailReg
end