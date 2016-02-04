require_relative 'abstract_page.rb'
require_relative 'home_page.rb'

require 'rspec'
require 'watir-webdriver'

class UseraccountPage < AbstractPage

	def initialize (browser)
		super(browser)
	end

	def create_n_edit_bitlink
		@@browser.button(:text => "CREATE BITLINK").click
    	sleep 5
    	@@browser.element(:css => ".action-sheet--MAIN form").text_field.set "https://newtest.com/abcd/etc/#{random_num}"
    	sleep 5
    	@@browser.element(:css => ".action-sheet--MAIN form").button(:text => "CREATE").click
    	sleep 5
    	testResult1 = @@browser.element(:css => ".action-sheet--MAIN a.bitlink--copyable-text").text.match(/bit.ly.*/)
    	puts "Result: The shorten URL before customized is #{testResult1}"
    	sleep 5
    	@@browser.element(:css => ".action-sheet--MAIN .input-field--CUSTOM").text_field(:css => ".input-field--input").set "#{optimized_text}"
    	sleep 5
    	@@browser.element(:css => ".action-sheet--MAIN form").button(:text => "SAVE").click
    	sleep 5
		return UseraccountPage.new(@@browser)
	end

	def verify_customized_bitlink
		@@testEdit = @@browser.element(:css => ".bitlink-detail--MAIN.open .bitlink--copy-wrapper .bitlink--copyable-text").text.match(/bit.ly.*/)
    	return @@testEdit
	end

end