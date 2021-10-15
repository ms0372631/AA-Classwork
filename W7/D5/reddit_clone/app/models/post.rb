class Post < ApplicationRecord
    validates :title, presence: true
    validates :sub_id, presence: true
    validates :user_id, presence: true
    
    belongs_to :sub,
        foreign_key: :sub_id,
        class_name: :Sub

    belongs_to :user,
        foreign_key: :user_id,
        class_name: :User

    
end
