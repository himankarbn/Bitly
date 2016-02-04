require_relative '../pageObject/home_page.rb'
require_relative '../pageObject/abstract_page.rb'
require_relative '../pageObject/useraccount_page.rb'
require 'rspec'
require 'watir-webdriver'

describe 'Bitly Coding Assignment' do

	app = nil

	before(:each) do
		app = AbstractPage.new(Watir::Browser.new:firefox)
	end

	after(:each) do
		app.quit
	end

	it "Verify Bitly Home Page" do
		page = app.navigateToApp.getPageTitle
		expect(page).to eql("Bitly | URL Shortener and Link Management Platform") 
	end

	it "Shorten URL without Signin from Homepage" do
		output = app.navigateToApp.shortenUrl.verify_shortenedUrl
		expect(output).to match(/bit.ly.*/)
	end

	it "Login And Shorten URL And Customize" do
		customized_link = app.navigateToApp.login.create_n_edit_bitlink.verify_customized_bitlink
		expect(customized_link.to_s).to match(/bit.ly\/demo.*/)
	end
end
