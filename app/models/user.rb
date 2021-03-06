class User < ApplicationRecord
  has_many :portfolios, dependent: :destroy
  has_many :comments,   dependent: :destroy
  has_many :favorites,  class_name: 'Favorite',
                        foreign_key: 'fan_id',
                        dependent: :destroy
  has_many :bookmarks,  through: :favorites,
                        source: :bookmark
  attr_accessor :remember_token, :activation_token, :reset_token
  before_save :downcase_email
  before_create :create_activation_digest
  validates :name,  presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGIX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGIX },
                    uniqueness: true
  has_secure_password
  validates :password, presence: true,
                       length: { minimum: 6, maximum: 16 },
                       allow_nil: true
  URL_REGIX = URI::regexp(%w(http https))
  validates :url, format: { with: URL_REGIX }, if: :url?
  validates :bio, length: { maximum: 140 }
  mount_uploader :icon, ImageUploader

  def activate
    update_attribute(:activated, true)
    update_attribute(:activated_at, Time.zone.now)
  end

  def send_activation_email
    UserMailer.account_activation(self).deliver_now
  end

  def send_password_reset_email
    UserMailer.password_reset(self).deliver_now
  end

  def password_reset_expired?
    reset_sent_at < 2.hours.ago
  end

  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  def forget
    update_attribute(:remember_digest, nil)
  end

  def authenticated?(attribute, token)
    digest = send("#{attribute}_digest")
    return false if digest.nil?

    BCrypt::Password.new(digest).is_password?(token)
  end

  def create_activation_digest
    self.activation_token = User.new_token
    self.activation_digest = User.digest(activation_token)
  end

  def create_reset_digest
    self.reset_token = User.new_token
    update_attribute(:reset_digest, User.digest(reset_token))
    update_attribute(:reset_sent_at, Time.zone.now)
  end

  def add_bookmark(portfolio)
    bookmarks << portfolio
  end

  def cancel_bookmark(portfolio)
    favorites.find_by(bookmark_id: portfolio.id).destroy
  end

  def bookmarked?(portfolio)
    bookmarks.include?(portfolio)
  end

  private

  def downcase_email
    self.email = email.downcase
  end

  class << self
    def digest(string)
      cost = if ActiveModel::SecurePassword.min_cost
               BCrypt::Engine::MIN_COST
             else
               BCrypt::Engine.cost
             end
      BCrypt::Password.create(string, cost: cost)
    end

    def new_token
      SecureRandom.urlsafe_base64
    end
  end
end
