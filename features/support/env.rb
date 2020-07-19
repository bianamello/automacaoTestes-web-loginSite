require 'capybara'
require 'capybara/cucumber'
require 'faker'
require 'rspec'
require 'selenium-webdriver'
require 'site_prism'

CONFIG = YAML.load_file(File.join(Dir.pwd, "configs/#{ENV['ENV_TYPE']}.yml"))

case ENV['BROWSER']
when 'firefox'
    @driver = :selenium
when 'chrome'
    @driver = :selenium_chrome
when 'headless'
    @driver = :selenium_chrome_headless
else
    puts 'Invalid Browser'
end

Capybara.configure do |config|
	config.default_driver = @driver
    config.default_max_wait_time = 8
end