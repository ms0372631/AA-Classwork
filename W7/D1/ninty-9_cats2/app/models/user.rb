class User < ApplicationRecord
    after_initialize :ensure_session_token
    validates :user_name, :password_digest, :session_token, presence: true
    validates :session_token, uniqueness: true

    attr_reader :password

    def self.find_by_credentials(username, password)
        user = User.find_by(username: username)
        return user if user && 
            BCrypt::Password.new(user.password_digest).is_password?(password)
        nil
    end
    
    def self.generate_session_token
        SecureRandom::urlsafe_base64(16)
    end

    def ensure_session_token
        self.session_token ||= User.generate_session_token
    end

    def reset_session_token!
        self.session_token = User.generate_session_token
        self.save!
        self.session_token
    end

    def password=(password)
        @password = password
        self.password_digest = BCrypt::Password.create(password)
    end
end
