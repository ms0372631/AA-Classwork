class Artwork < ApplicationRecord
    validates :title, presence: true
    validates :artist_id, presence: true, uniqueness: {scope: :title}
    validates :image_url, presence: true

    belongs_to :artist,
        primary_key: :id,
        foreign_key: :artist_id,
        class_name: :Artist
        

end