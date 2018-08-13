class CreateArtworkShares < ActiveRecord::Migration[5.2]
  def change
    create_table :artwork_shares do |t|
      t.integer :user_id
      t.integer :artwork_id
      t.timestamps
    end
  end
end
