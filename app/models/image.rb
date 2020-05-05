class Image < ApplicationRecord
  belongs_to :portfolio, optional: true
  mount_uploader :image, ImageUploader
  validates :description, length: { maximum: 30 }
end
