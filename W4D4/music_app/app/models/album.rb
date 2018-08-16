# == Schema Information
#
# Table name: albums
#
#  id         :bigint(8)        not null, primary key
#  year       :integer
#  live_album :boolean          default(FALSE)
#  band_id    :integer          not null
#  title      :string           not null
#

class Album < ApplicationRecord
  validates :title, :band_id, presence: true

  belongs_to :band
  has_many :tracks, dependent: :destroy
end
