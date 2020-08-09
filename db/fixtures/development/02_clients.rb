2.times do |i|
  Client.seed do |c|
    c.name = "クライアント#{i + 1}"
    c.users_limit = (i + 1) * 10
  end
end
