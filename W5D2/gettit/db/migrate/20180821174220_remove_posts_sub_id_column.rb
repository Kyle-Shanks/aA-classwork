class RemovePostsSubIdColumn < ActiveRecord::Migration[5.2]
  def change
    remove_column :posts, :sub_id
    remove_column :posts, :url
    add_column :posts, :url, :string
  end
end
