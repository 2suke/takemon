# admin user
User.create!(
  name: 'AdminUser',
  email: 'admin-user@takemon.demo',
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

User.create!(
  name: 'Edward Munch (demo)',
  email: 'munch@takemon.demo',
  password: 'takemon',
  password_confirmation: 'takemon',
  activated: true,
  activated_at: Time.zone.now,
)

User.create!(
  name: '井之頭 吾郎 (demo)',
  email: 'lonely-gourmet@takemon.demo',
  password: 'takemon',
  password_confirmation: 'takemon',
  activated: true,
  activated_at: Time.zone.now,
)
