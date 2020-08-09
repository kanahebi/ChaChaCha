User.pluck(:id).each do |user_id|
  2.times do |i|
    DailyReport.seed do |d|
      d.user_id = user_id
      d.memo = "がんばった\nやったね\n#{i}"
    end
  end
end
