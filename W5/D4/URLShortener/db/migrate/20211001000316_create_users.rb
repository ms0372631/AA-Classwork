class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string "email", null: false
      t.timestamps
    end
      add_index :users, :email
  end
end
