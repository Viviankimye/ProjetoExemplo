require 'base64'
require 'date'
require 'ffaker'
require 'faker'
require 'json'
require 'net/http'
require 'pry'
require 'rest-client'
# require 'rspec'
require 'uri'
require 'yaml'

if ENV['dev']
  $ambiente = "dev"
elsif ENV['staging']
    $ambiente = "staging"
elsif ENV['hom']
  $ambiente = "hom"
elsif ENV['prod']
  $ambiente = "prod"
else
  $ambiente = "hom"
end

$report_time = Time.now.strftime("%d-%m_%H-%M")
$report_title = "Data: #{Time.now.strftime("%d/%m")}, Hora: #{Time.now.strftime("%H:%M")}"

MASSA = YAML.load_file('data/massa_teste.yml')
DATA = YAML.load_file('data/data.yml')