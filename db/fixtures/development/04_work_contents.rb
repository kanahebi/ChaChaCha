Client.where(id: [1, 2]).pluck(:id).each do |client_id|
  3.times do |i|
    WorkContent.seed do |w|
      w.client_id = client_id
      w.name = "クライアント#{client_id}_作業#{i}"
      w.name_kana = "サギョウ#{i}"
    end
  end
end
