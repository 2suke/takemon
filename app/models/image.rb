class Image < ApplicationRecord
  belongs_to :portfolio, optional: true
  mount_uploader :image, ImageUploader
  valid :portfolio_id, presence: true
  valid :image, presence: true
end
