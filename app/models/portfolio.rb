class Portfolio < ApplicationRecord
  belongs_to :user, dependent: :destroy
  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images, allow_destroy: true
  validates :user_id, presence: true
  validates :title,   presence: true, length: { maximum: 30 }
  validates :detail,  presence: true, length: { minimum: 1 }
end
