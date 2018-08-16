class CreateTracks < ActiveRecord::Migration[5.2]
  def change
    create_table :tracks do |t|
      t.string :title, null: false
      t.integer :ord, null: false
      t.text :lyrics
      t.boolean :bonus_track, default: false
      t.integer :album_id, null: false
      t.timestamps
    end
  end
end
