User.seed do |u|
  u.unique_name = "system_admin"
  u.name = "システム管理者"
  u.password = 'password'
  u.password_confirmation = 'password'
  u.role = :system_admin
end

2.times do |i|
  User.seed do |u|
    u.unique_name = "client_admin#{i + 1}"
    u.name = "クライアント管理者#{i + 1}"
    u.password = 'password'
    u.password_confirmation = 'password'
    u.role = :client_admin
  end
end

3.times do |i|
  User.seed do |u|
    u.unique_name = "client_general#{i + 1}"
    u.name = "クライアントユーザ#{i + 1}"
    u.password = 'password'
    u.password_confirmation = 'password'
    u.role = :client_general
  end
end
