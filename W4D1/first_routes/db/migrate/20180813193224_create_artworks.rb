class CreateArtworks < ActiveRecord::Migration[5.2]
  def change
    create_table :artworks do |t|
      t.string :name
      t.integer :owner_id
      t.timestamps
    end
  end
end
