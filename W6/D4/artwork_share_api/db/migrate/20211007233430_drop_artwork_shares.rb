class DropArtworkShares < ActiveRecord::Migration[5.2]
  def change
    drop_table :artwork_shares
  end
end
