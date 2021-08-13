require 'rspec'
require 'yaml'
require 'pry'
require 'capybara/cucumber'
require 'ffaker'
require 'faker'
require 'selenium-webdriver'
require 'json'
require 'report_builder'
require 'screen-recorder'

Capybara.default_max_wait_time = 30
Capybara.default_normalize_ws = true

MASSA = YAML.load_file('data/massa_teste.yml')
EL = YAML.load_file('data/elementos.yml')
DATA = YAML.load_file('data/data.yml')
LOCAL = YAML.load_file('data/local_storage.yml')

if ENV['dev']
  $ambiente = "dev"
elsif ENV['hom']
  $ambiente = "hom"
elsif ENV['prod']
  $ambiente = "prod"
else
  $ambiente = "hom"
end

$report_time = Time.now.strftime("%d-%m %H:%M")
$report_title = "Data: #{Time.now.strftime("%d/%m")}, Hora: #{Time.now.strftime("%H:%M")}"

  if ENV['chrome']
  Capybara.default_driver = :chrome
  Capybara.register_driver :chrome do |app|
    options = Selenium::WebDriver::Chrome::Options.new
    options.add_argument('--disable-web-security')
    options.add_argument('--reduce-security-for-testing')
    options.add_argument('--disable-print-preview')
    options.add_argument('--incognito')
    Capybara::Selenium::Driver.new(app,browser: :chrome, options: options) 
  end
  elsif ENV['chrome_headless']
    Capybara.default_driver = :chrome_headless
    Capybara.register_driver :chrome_headless do |app|
      options = Selenium::WebDriver::Chrome::Options.new
      options.add_argument('--disable-web-security')
      options.add_argument('--reduce-security-for-testing')
      options.add_argument('--incognito')
      options.add_argument('--headless')
      options.add_argument('--no-sandbox')
      Capybara::Selenium::Driver.new(app,browser: :chrome, options: options)
    end
  elsif ENV['firefox']
    Capybara.default_driver = :firefox
    Capybara.register_driver :firefox do |app|
      Capybara::Selenium::Driver.new(app, browser: :firefox)
    end
  elsif ENV['headless_debug']
    Capybara.default_driver = :poltergeist_debug
    Capybara.register_driver :poltergeist_debug do |app|
      Capybara::Poltergeist::Driver.new(app, inspector: true)
    end
    Capybara.javascript_driver = :poltergeist_debug
  elsif ENV['headless']
    Capybara.javascript_driver = :poltergeist
    Capybara.default_driver = :poltergeist
  else
    #Capybara.default_driver = :selenium
    Capybara.default_driver = :chrome
    Capybara.register_driver :chrome do |app|
    #options = Selenium::WebDriver::Chrome::Options.new
    #options.add_argument('--disable-web-security')
    #options.add_argument('--reduce-security-for-testing')
    #options.add_argument('--disable-print-preview')
    #options.add_argument('--incognito')
    #Capybara::Selenium::Driver.new(app,browser: :chrome, options: options)
      Capybara::Selenium::Driver.new(app,browser: :chrome,options: Selenium::WebDriver::Chrome::Options.new(args: %w[disable-web-security disable-print-preview reduce-security-for-testing repl incognito]))
    end
  end