class User < ApplicationRecord

  validates :name, presence: true, uniqueness: true
  validates :session_token, :password_digest, presence: true
  validates :password, length: {minimum: 6}, allow_nil: true

  before_validation :ensure_session_token

  attr_reader :password

  def self.find_by_credentials(name, password)
    @user = User.find_by(name: name)
    return @user if @user && @user.is_password?(password)
  end

  def reset_token!
    self.session_token = SecureRandom::urlsafe_base64(16)
    self.save!
    self.session_token
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def ensure_session_token
    self.session_token ||= SecureRandom::urlsafe_base64(16)
  end

end
