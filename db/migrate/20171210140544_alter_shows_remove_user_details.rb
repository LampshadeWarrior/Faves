class AlterShowsRemoveUserDetails < ActiveRecord::Migration[5.0]
  def change
    remove_column :shows, :name, :string
    remove_column :shows, :person, :string
    remove_column :shows, :city, :string
    add_column :shows, :title, :string
  end
end
