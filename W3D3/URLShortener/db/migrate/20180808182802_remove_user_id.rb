class RemoveUserId < ActiveRecord::Migration[5.2]
  def change
    remove_column :shortened_urls, :user_id
  end
end
