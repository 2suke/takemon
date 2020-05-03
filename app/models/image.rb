class Image < ApplicationRecord
  belongs_to :portfolio, optional: true
  mount_uploader :image, ImageUploader
  validates :portfolio_id, presence: true
  validates :image, presence: true
end
