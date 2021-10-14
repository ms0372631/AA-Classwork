class User < ApplicationRecord
  attr_reader :password, :username

  
  
  validates :username, :email, :session_token, presence: true, uniqueness: true
  validates :password_digest, presence: true
  validates :password, length: {minimum: 6}, allow_nil: true


  def password=(password)
    self.password_digest = BCrypt::Password.create(password)
    @password = password
  end

  def ensure_session_token
    self.session_token ||= SecureRandom::urlsafe_base64
  end

  def self.find_by_credentials(username, password)
    user = User.find_by(username: username)
    if user && user.find_by_password?(password)
      return user
    else
      nil
    end
  end

  def is_valid_password?(password)
    password_object = BCrypt::Password.new(self.password_digest)
    password_object.is_password?(password)
  end

  def reset_session_token!
    self.session_token = SecureRandom::urlsafe_base64
    self.save!
    self.session_token
  end

end
