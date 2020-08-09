User.where(role: :client_general).pluck(:id).each do |user_id|
  2.times do |i|
    DailyReport.seed do |d|
      d.user_id = user_id
      d.date = Time.current.ago(i.days)
      d.memo = "がんばった\nやったね\n#{i}"
    end
  end
end
