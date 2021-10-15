class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :title, null: false
      t.string :url
      t.text :content
      t.integer :sub_id, null: false
      t.integer :user_id, null: false

      t.timestamps
    end
    add_index :posts, :sub_id
    add_index :posts, :user_id
  end
end
