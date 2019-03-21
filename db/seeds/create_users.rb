p "Create test users"

User.find_or_create_by(email: 'user@test.com') do |user|
  user.password = '1111111'
  user.password_confirmation = '1111111'
  user.first_name = 'Petro'
  user.last_name = 'Dry'
end

User.find_or_create_by(email: 'user1@test.com') do |user|
  user.password = '1111111'
  user.password_confirmation = '1111111'
  user.first_name = 'Ivan'
  user.last_name = 'Urban'
end

User.find_or_create_by(email: 'user2@test.com') do |user|
  user.password = '1111111'
  user.password_confirmation = '1111111'
  user.first_name = 'Stepan'
  user.last_name = 'Topol'
end
