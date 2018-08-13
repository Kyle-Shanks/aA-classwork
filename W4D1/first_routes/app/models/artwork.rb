# == Schema Information
#
# Table name: artworks
#
#  id         :bigint(8)        not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  artist_id  :integer
#  title      :string
#  image_url  :string
#

class Artwork < ApplicationRecord
  validates :artist_id, presence: true
  validates :title, presence: true
  validates :image_url, presence: true
  validate :not_dup_title

  belongs_to :artist,
    primary_key: :id,
    foreign_key: :artist_id,
    class_name: 'User'

  has_many :shares,
    primary_key: :id,
    foreign_key: :artwork_id,
    class_name: 'ArtworkShare'

  has_many :shared_viewers,
    through: :shares,
    source: :viewer

  def not_dup_title
    artist = User.find(artist_id)
    check = artist.artworks.none? { |art| art.title == self.title}
    unless check
      self.errors[:title] = 'Title cannot be a duplicate'
    end
  end
end
