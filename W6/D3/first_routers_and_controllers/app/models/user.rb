class User < ApplicationRecord

    validates :name, presence: true, uniqueness: true
    validates :email, presence: true, uniqueness: true

end