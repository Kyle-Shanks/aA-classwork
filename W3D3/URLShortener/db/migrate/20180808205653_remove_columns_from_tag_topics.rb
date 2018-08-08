class RemoveColumnsFromTagTopics < ActiveRecord::Migration[5.2]
  def change
    remove_column :tag_topics, :url_id
    remove_column :tag_topics, :tagger_id
  end
end
