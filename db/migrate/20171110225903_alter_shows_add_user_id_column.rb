class AlterShowsAddUserIdColumn < ActiveRecord::Migration[5.0]
  def change
    add_column :shows, :user_id, :integer
    add_index :shows, :user_id
  end
end
