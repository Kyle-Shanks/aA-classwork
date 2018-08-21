class CreateSubs < ActiveRecord::Migration[5.2]
  def change
    create_table :subs do |t|
      t.string :title, null: false, index: true
      t.string :description
      t.string :moderator, null: false
      
      t.timestamps
    end
  end
end
