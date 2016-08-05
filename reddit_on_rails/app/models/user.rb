class User < ActiveRecord::Base
  validates :username, :password_digest, :session_token, presence: true
  validates :password, length: {minimum: 6, allow_nil: true}
  validates :username, uniqueness: true

  attr_reader :password

  has_many :comments
  has_many :posts
  has_many :modded_subs,
  foreign_key: :mod_id,
  class_name: :Sub

  before_validation :ensure_session_token

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def ensure_session_token
    self.session_token ||= SecureRandom::urlsafe_base64(32)
  end

  def reset_session!
    self.session_token = SecureRandom::urlsafe_base64(32)
    self.save!
  end

  def is_password?(password)
    pw = BCrypt::Password.new(self.password_digest)
    pw.is_password?(password)
  end

  def self.find_by_credentials(username, password)
    user = User.find_by(username: username)
    return nil unless user
    user.is_password?(password) ? user : nil
  end
end
