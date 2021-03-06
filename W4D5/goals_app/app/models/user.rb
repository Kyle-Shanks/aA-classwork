class User < ApplicationRecord
  before_validation :ensure_session_token

  validates :username, :email, presence: true, uniqueness: true
  validates :session_token, :password_digest, presence: true
  validates :password, length: { minimum: 6 }, allow_nil: true

  has_many :goals
  has_many :comments

  attr_reader :password

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def self.find_by_credentials(email, password)
    user = User.find_by(email: email)
    return user if user && user.is_password?(password)
    nil
  end

  def self.generate_session_token
    SecureRandom::urlsafe_base64(16)
  end

  def ensure_session_token
    self.session_token ||= self.class.generate_session_token
  end

  def reset_session_token!
    self.session_token = self.class.generate_session_token
    self.save!
    self.session_token
  end

  def is_password?(password)
    bcrypt_pw = BCrypt::Password.new(self.password_digest)
    bcrypt_pw.is_password?(password)
  end
end
