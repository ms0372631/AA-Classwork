class Modify < ActiveRecord::Migration[5.2]
  def change
    add_column :albums, :band_id, :integer, null: false
  end
end
