require 'report_builder'

at_exit do
  ReportBuilder.configure do |config|
    config.json_path = 'data/reports/report.json'
    config.report_path = "data/reports/report-#{$report_time}"
    config.report_types = [:html]
    config.report_title = "Titulo do report - #{$report_title}"
    config.color = 'blue'
    config.include_images = true
  end
  ReportBuilder.build_report
end   
     
# After do |scn|
#   if scn.failed?
#     binding.pry
#   end
# end