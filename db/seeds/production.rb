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
