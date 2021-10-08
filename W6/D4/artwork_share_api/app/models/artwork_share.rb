class ArtworkShare < ApplicationRecord
  validates :viewer_id, presence: true, uniqueness: {scope: :artwork_id}

  belongs_to :viewer,
  primary_key: :id,
  foreign_key: :viewer_id,
  class_name: :Artist

  belongs_to :artwork,
  primary_key: :id,
  foreign_key: :artwork_id,
  class_name: :Artwork



end

# create_table "artwork_shares", force: :cascade do |t|
#     t.integer "artwork_id", null: false
#     t.integer "viewer_id", null: false
#     t.datetime "created_at", null: false
#     t.datetime "updated_at", null: false
#     t.index ["artwork_id"], name: "index_artwork_shares_on_artwork_id"
#     t.index ["viewer_id"], name: "index_artwork_shares_on_viewer_id"