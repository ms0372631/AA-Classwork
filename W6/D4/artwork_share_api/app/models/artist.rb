class Artist < ApplicationRecord
    validates :username, presence: true, uniqueness: true

    has_many :artworks,
        primary_key: :id,
        foreign_key: :artist_id,
        class_name: :Artwork,
        dependent: :destroy   

    has_many :artworks_shares,
    primary_key: :id,
    foreign_key: :viewer_id,
    class_name: :ArtworkShare,
    dependent: :destroy

    has_many :shared_artworks,
    through: :artwork_shares,
    source: :artwork
end

# create_table "artists", force: :cascade do |t|
#     t.string "username", null: false
#     t.datetime "created_at", null: false
#     t.datetime "updated_at", null: false