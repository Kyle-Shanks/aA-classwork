class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :title, null: false, index: true
      t.string :url, null: false
      t.integer :user_id, null: false, index: true
      t.text :content

      t.timestamps
    end
  end
end
