class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :image
      t.string :text
      t.integer :likes
      t.text :comments
      t.timestamps
    end
  end
end
