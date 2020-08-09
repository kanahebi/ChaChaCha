User.seed do |u|
  u.unique_name = "system_admin"
  u.name = "システム管理者"
  u.password = 'password'
  u.password_confirmation = 'password'
  u.role = :system_admin
end

Client.where(id: [1, 2]).pluck(:id).each do |client_id|
  User.seed do |u|
    u.client_id = client_id
    u.unique_name = "client_admin#{client_id}"
    u.name = "クライアント#{client_id}管理者"
    u.password = 'password'
    u.password_confirmation = 'password'
    u.role = :client_admin
  end

  3.times do |i|
    User.seed do |u|
      u.client_id = client_id
      u.unique_name = "client_general#{client_id}_#{i}"
      u.name = "クライアント#{client_id}_ユーザ#{i}"
      u.password = 'password'
      u.password_confirmation = 'password'
      u.role = :client_general
    end
  end
end
