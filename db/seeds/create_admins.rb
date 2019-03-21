p "Create hr admins"

User.find_or_create_by(email: 'hr1@test.com') do |user|
  user.password = '1111111'
  user.password_confirmation = '1111111'
  user.first_name = 'Ivan'
  user.last_name = 'Hr1'
  user.admin = true
end

User.find_or_create_by(email: 'hr3@test.com') do |user|
  user.password = '1111111'
  user.password_confirmation = '1111111'
  user.first_name = 'Ivan'
  user.last_name = 'Hr2'
  user.admin = true
end
