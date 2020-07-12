# admin user
User.create!(
  name: 'AdminUser',
  email: 'admin-user@takemon.org',
  password: 'takemon',
  password_confirmation: 'takemon',
  activated: true,
  activated_at: Time.zone.now,
  admin: true
)

# guest user
User.create!(
  name: 'ゲストユーザー',
  email: 'guest@takemon.org',
  password: 'takemon',
  password_confirmation: 'takemon',
  activated: true,
  activated_at: Time.zone.now,
  guest: true
)

# demo users
30.times do |n|
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
users = User.order(:created_at).take(1)
users.each do |user|
  portfolio = user.portfolios.create!(title: 'sample app', detail: 'demodata')
  10.times do |n|
    demofile_path = "#{Rails.root}/db/fixtures/slide_image/number_#{n}.png"
    portfolio.images.create!(description: 'description',
                             image: File.open(demofile_path.to_s))
  end
end
