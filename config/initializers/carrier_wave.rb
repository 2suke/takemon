if Rails.env.production?
  CarrierWave.configure do |config|
    config.fog_credentials = {
      provider: 'AWS',
      region: 'ap-northeast-1',
      aws_access_key_id: Rails.application.credentials.s3[:access],
      aws_secret_access_key: Rails.application.credentials.s3[:secret]
    }
    config.fog_directory = 'takemon-strage'
  end
end
