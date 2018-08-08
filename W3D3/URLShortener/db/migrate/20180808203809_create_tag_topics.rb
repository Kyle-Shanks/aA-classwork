class CreateTagTopics < ActiveRecord::Migration[5.2]
  def change
    create_table :tag_topics do |t|
      t.string :name
      t.integer :url_id
      t.integer :tagger_id
      t.timestamps
    end
  end
end
