if Rails.env.production?
  CarrierWave.configure do |config|
    config.fog_credentials = {
      :provider              => 'AWS',
      :region                => Rails.application.credentials.s3[:region],
      :aws_access_key_id     => Rails.application.credentials.s3[:access],
      :aws_secret_access_key => Rails.application.credentials.s3[:secret]
    }
    config.fog_directory     =  Rails.application.credentials.s3[:bucket]
  end
end
