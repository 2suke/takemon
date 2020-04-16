# admin user
User.create!(
  name: 'Example User',
  email: 'example@railstutorial.org',
  password: 'foobar',
  password_confirmation: 'foobar',
  activated: true,
  activated_at: Time.zone.now
)

# demo users
99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n + 1}@railstutorial.org"
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
users = User.order(:created_at).take(1)
users.each { |user| user.portfolios.create!(title: 'sample app', detail: 'demodata')}
