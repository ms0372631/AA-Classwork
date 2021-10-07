class Artwork < ApplicationRecord
    validates :title, presence: true
    validates :artist_id, presence: true, uniqueness: {scope: :title}
    validates :image_url, presence: true

    belongs_to :artist,
        primary_key: :id,
        foreign_key: :artist_id,
        class_name: :Artist
    
    has_many :artwork_shares,
    primary_key: :id,
    foreign_key: :artwork_id,
    class_name: :ArtworkShare

    
    has_many :shared_viewers,
    through: :artwork_shares,
    source: :viewer
end

# create_table "artworks", force: :cascade do |t|
#     t.string "title", null: false
#     t.string "image_url", null: false
#     t.integer "artist_id", null: false
#     t.datetime "created_at", null: false
#     t.datetime "updated_at", null: false
#     t.index ["artist_id"], name: "index_artworks_on_artist_id"