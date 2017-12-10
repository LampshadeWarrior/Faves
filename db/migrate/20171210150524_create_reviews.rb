class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.integer :user_id
      t.integer :show_id
      t.integer :rating
      t.text :body
      t.string :title

      t.timestamps
    end
  end
end
