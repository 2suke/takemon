class Portfolio < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true
  validates :detail, presence: true, length: { minimum: 1 }
end
