class AddColumnToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :sub_id, :integer, null: false, index: true
  end
end
