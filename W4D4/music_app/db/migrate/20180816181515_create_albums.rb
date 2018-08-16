class CreateAlbums < ActiveRecord::Migration[5.2]
  def change
    create_table :albums do |t|
      t.string  :name, null: false
      t.integer :year
      t.boolean :live_album, default: false
      t.integer :band_id, null: false
    end
  end
end
