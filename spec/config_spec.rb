require 'rspec'
require 'capybara'
require 'selenium-webdriver'

RSpec.configure do |config|
  config.before(:all) do
    Capybara::Session.new :selenium_chrome
    current_window.fullscreen
  end

  config.before(:each) do
    visit 'http://navigator.ba'
  end
end

Capybara.configure do |config|
  config.default_driver = :selenium_chrome
  config.ignore_hidden_elements = false
  config.default_max_wait_time = 5
end
