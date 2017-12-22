class AddShowIdIndexToShows < ActiveRecord::Migration[5.0]
  def change
    add_column :shows, :show_id, :integer

    add_index :shows, :show_id
  end
end
