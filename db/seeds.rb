# admin user
User.create!(
  name: 'AdminUser',
  email: 'admin-user@takemon.org',
  password: 'takemon',
  password_confirmation: 'takemon',
  activated: true,
  activated_at: Time.zone.now
)

# demo users
49.times do |n|
  name  = Faker::Name.name
  email = "example-#{n + 1}@takemon.org"
  password = 'password'
  User.create!(
    name: name,
    email: email,
    password: password,
    password_confirmation: password,
    activated: true,
    activated_at: Time.zone.now
  )
end

# demo portfolio
# users = User.order(:created_at).take(1)
# users.each { |user| user.portfolios.create!(title: 'sample app', detail: 'demodata')}
