class TagTopic < ApplicationRecord

  has_many :taggings,
    primary_key: :id,
    foreign_key: :tag_id,
    class_name: 'Tagging'

  has_many :links,
    through: :taggings,
    source: :url

  def popular_links
    arr = self.links.map { |url| [url,url.num_clicks] }
    arr.sort_by { |array| -array[1] }[0,5]
  end

end
