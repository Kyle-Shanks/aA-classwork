class CorrectArtworkShareColumnNames < ActiveRecord::Migration[5.2]
  def change
    remove_column :artwork_shares, :user_id
    add_column :artwork_shares, :viewer_id, :integer
  end
end
