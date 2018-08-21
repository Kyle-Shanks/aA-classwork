# == Schema Information
#
# Table name: subs
#
#  id          :bigint(8)        not null, primary key
#  title       :string           not null
#  description :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :integer          not null
#

class Sub < ApplicationRecord

  validates :title, :user_id, presence: true

  belongs_to :moderator,
    foreign_key: :user_id,
    class_name: 'User'

  has_many :sub_posts, dependent: :destroy, inverse_of: :sub

  has_many :posts,
    through: :sub_posts,
    source: :post


end
