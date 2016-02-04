require_relative 'abstract_page.rb'
require 'rspec'
require 'watir-webdriver'

class HomePage < AbstractPage

	def initialize (browser)
		super(browser)
	end

	def signin_fieldset
    	return @@browser.element(:css => "form#sign-in fieldset")
  	end

	def clickTour
		@@browser.element(:css, ".navigation a[href='/pages/tour']").click
	end

	def shortenUrl_textfield
		@@browser.text_field(:id => "shorten_url")
		return HomePage.new(@@browser)
	end

	def shortenUrl
		@@browser.text_field(:name => "url").when_present.set "https://newtest.com/abcd/etc/#{random_num}"
    	sleep 2
    	@@browser.button(:value => "Shorten").click
    	sleep 2
    	return HomePage.new(@@browser)
	end

	def verify_shortenedUrl
		@@testResult = @@browser.input(:id => "shorten_url").value.match(/bit.ly.*/)
    	if @@testResult != nil
      		puts "PASS: The shorten URL is #{@@testResult}"
    	else
      		puts "FAIL: Results not verified."
    	end
    	return @@browser.element(:xpath => "//a[contains(.,'#{@@testResult}')]").text
	end

	def login
		@@browser.element(:css => ".header-button-wrapper").link(:text => "Login").when_present.click
    	sleep 5
    	signin_fieldset.text_field(:name => "username").when_present.set "mails2nik@gmail.com"
    	signin_fieldset.text_field(:name => "password").when_present.set "Gunner@10"
    	@@browser.button(:value => "Sign in").click
    	sleep 10
    	return UseraccountPage.new(@@browser)
    end   	
end