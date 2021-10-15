class Sub < ApplicationRecord
    validates :title, presence: true
    validates :description, presence: true
    validates :user_id, presence: true
    
    has_many :posts,
        foreign_key: :sub_id,
        class_name: :Post
    
    belongs_to :user,
        foreign_key: :user_id,
        class_name: :User

    
end
