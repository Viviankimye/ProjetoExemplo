require 'selenium-webdriver'
require 'report_builder'
require 'json'

Before do |scn|
  Capybara.current_session.driver.browser.manage.delete_all_cookies
  page.driver.quit
  Capybara.page.driver.browser.manage.window.maximize
end

ReportBuilder.configure do |config|
  config.json_path = 'data/reports/report.json'
  config.report_path = "data/reports/report-#{$report_time}"
  config.report_types = [:html]
  config.report_title = "Projeto-Exemplo - #{$report_title}"
  config.color = "blue"
end

After do |scn|
  sleep(3)
  if scn.failed?
    save_screenshot("data/screenshots/bugs/bug-(#{scn.name}).png")
  end
end

at_exit do
  ReportBuilder.build_report
end

Before do |scn|
  $scn = scn.name
  # if $numerodovideo.to_s == ''
  #   $numerodovideo = "1" 
  # else 
  #   $numerodovideo = $numerodovideo.to_i
  #   $numerodovideo +=1
  #   $numerodovideo = $numerodovideo.to_s
  # end
  # @recorder = Comum.new.screen_recorder("#{scn.name}")
  # @recorder.start
end

# AfterStep do |step|
#   data = "#{Time.now.strftime('%Y/%B/%d')}"
#   hora = "#{Time.now.strftime('%H-%M-%S')}"
#   save_screenshot("data/screenshots/evidencias/#{step}.png")
# end
