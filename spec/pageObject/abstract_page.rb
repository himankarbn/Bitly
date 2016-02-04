require_relative 'home_page.rb'
require 'rspec'
require 'watir-webdriver'

class AbstractPage
	@@browser = nil

	def initialize (browser)
		@@browser = browser
		@@browser.window.resize_to 1100, 850
		@@browser.driver.manage.timeouts.implicit_wait = 60
	end

	def navigateToApp
		@@browser.goto('http://www.bitly.com')
		return HomePage.new(@@browser)
	end

	def random_num(length=5)
    	rand(10000..99999).to_s[0,length]
  	end

  	def optimized_text
    	@@optimized_text = "demo"+rand(1000..9999).to_s[0,4]
  	end

	def quit
		@@browser.quit
	end

	def getPageTitle
		return @@browser.title
	end
end