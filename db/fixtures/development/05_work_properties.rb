Client.where(id: [1, 2]).pluck(:id).each do |client_id|
  3.times do |i|
    WorkProperty.seed do |w|
      w.client_id = client_id
      w.name = "クライアント#{client_id}_物件#{i}"
      w.code = "A#{client_id}-00#{i}"
    end
  end
end
