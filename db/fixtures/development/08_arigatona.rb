DailyReport.all.each do |daily_report|
  Arigatona.seed do |a|
    a.daily_report = daily_report
    a.user = daily_report.user.client.users.first
    a.comment = "助けてくれてありがとう\nうれしいです"
  end
end
