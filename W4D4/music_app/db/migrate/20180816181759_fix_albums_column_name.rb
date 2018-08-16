class FixAlbumsColumnName < ActiveRecord::Migration[5.2]
  def change
    remove_column :albums, :name
    add_column :albums, :title, :string, null: false
  end
end
