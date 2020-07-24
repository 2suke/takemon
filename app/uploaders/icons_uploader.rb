class IconsUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  process resize_to_limit: [128, 128]

  if Rails.env.production?
    storage :fog
  elsif
    storage :file
  end

  def store_dir
    "icons/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def extension_whitelist
    %w[jpg jpeg gif png]
  end
end
