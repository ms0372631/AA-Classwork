class User < ApplicationRecord
    validates :email, :session_token, presence: true
    validates :password_digest, presence: { message: 'Password can\'t be blank' }
    validates :email, uniqueness: true

    attr_reader :password

    after_initialize :ensure_session_token

    def self.find_by_credentials(email, password)
        user = User.find_by(username: username)
        return user if user && user.is_valid_password?(password)
        nil   
    end

    def self.generate_session_token
        SecureRandom.urlsafe_base64
    end

    def reset_session_token!
        self.session_token = User.generate_session_token
        self.save!
        self.session_token
    end

    def ensure_session_token
        self.session_token ||= User.generate_session_token
    end

    def password=(password)
        #In #password= use self.password_digest=. (
        #self.___= calls a setter method defined for us by ActiveRecord, which is the state that is saved by self.save.
        #While @___ makes a new instance variable, unrelated to self.save)
        self.password_digest = Bcrypt::Password.create(password)
        @password = password
    end

    def is_password?(password)
        Bcrypt::Password.new(self.password_digest).is_password?(password)
    end
end
