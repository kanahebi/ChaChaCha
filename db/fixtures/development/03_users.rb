User.seed do |u|
  u.unique_name = "system_admin"
  u.name = "システム管理者"
  u.password = 'password'
  u.password_confirmation = 'password'
  u.role = :system_admin
end

Client.where(id: [1, 2]).each do |client|
  User.seed do |u|
    u.client = client
    u.unique_name = "client_admin#{client.id}"
    u.name = "クライアント#{client.id}管理者"
    u.password = 'password'
    u.password_confirmation = 'password'
    u.role = :client_admin
  end

  3.times do |i|
    User.seed do |u|
      u.client = client
      u.department = client.departments.first
      u.unique_name = "client_general#{client.id}_#{i}"
      u.name = "クライアント#{client.id}_ユーザ#{i}"
      u.password = 'password'
      u.password_confirmation = 'password'
      u.role = :client_general
    end
  end
end
