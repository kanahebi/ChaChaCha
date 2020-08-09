Client.where(id: [1, 2]).pluck(:id).each do |client_id|
  2.times do |i|
    Department.seed do |d|
      d.client_id = client_id
      d.name = "クライアント#{client_id}部署#{i}"
    end
  end
end
