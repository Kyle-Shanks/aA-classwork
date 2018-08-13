# == Schema Information
#
# Table name: artwork_shares
#
#  id         :bigint(8)        not null, primary key
#  artwork_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  viewer_id  :integer
#

class ArtworkShare < ApplicationRecord
  validates :viewer_id, presence: true
  validates :artwork_id, presence: true
  validate :not_dup_share

  belongs_to :viewer,
    primary_key: :id,
    foreign_key: :viewer_id,
    class_name: 'User'

  belongs_to :artwork,
    primary_key: :id,
    foreign_key: :artwork_id,
    class_name: 'Artwork'

  def not_dup_share
    viewer = User.find(viewer_id)
    check = viewer.artwork_shares.none?  do |share|
      share.artwork_id == self.artwork_id
    end
    unless check
      self.errors[:artwork_id] << 'Share cannot be a duplicate'
    end
  end

end
