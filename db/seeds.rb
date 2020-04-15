User.create!(
  name: 'takemon',
  email: 'admin-user@takemon.org',
  password: 'takemon',
  password_confirmation: 'takemon',
  activated: true,
  activated_at: Time.zone.now
)

User.create!(
  name: 'guest',
  email: 'guest-user@takemon.org',
  password: 'guest',
  password_confirmation: 'guest',
  activated: true,
  activated_at: Time.zone.now
)

99.times do |n|
  name = Faker::Name.name
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
