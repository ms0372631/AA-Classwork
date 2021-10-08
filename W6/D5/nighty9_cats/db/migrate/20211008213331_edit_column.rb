class EditColumn < ActiveRecord::Migration[5.2]
  def change
      remove_column :cats, :sex
      add_column :cats, :sex, :string, :limit => 1, null: false
  end
end
