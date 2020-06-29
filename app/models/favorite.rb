class Favorite < ApplicationRecord
  belongs_to :fan,      class_name: 'User'
  belongs_to :bookmark, class_name: 'Portfolio'
  validates :fan_id,      presence: true
  validates :bookmark_id, presence: true
end
