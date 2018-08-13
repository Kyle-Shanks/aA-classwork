class AddArtworkInformationColumns < ActiveRecord::Migration[5.2]
  def change
    remove_column :artworks, :owner_id
    add_column :artworks, :artist_id, :integer
    add_column :artworks, :title, :string
    add_column :artworks, :image_url, :string
  end
end
