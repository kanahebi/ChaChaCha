DailyReport.all.each do |daily_report|
  2.times do |i|
    Work.seed do |w|
      w.daily_report = daily_report
      w.work_content = daily_report.user.client.work_contents.first
      w.work_property = daily_report.user.client.work_properties.first
      w.start_at = 3.hours.ago
      w.end_at = 1.hours.ago
    end
  end
end
