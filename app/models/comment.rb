class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :portfolio, optional: true
  belongs_to :comment,   optional: true
  has_many   :replies,   class_name: 'Comment',
                         foreign_key: :base,
                         dependent: :destroy
  validates :message, presence: true, length: { maximum: 140 }
  accepts_nested_attributes_for :replies, allow_destroy: true
end
