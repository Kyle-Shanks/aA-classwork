# == Schema Information
#
# Table name: posts
#
#  id         :bigint(8)        not null, primary key
#  title      :string           not null
#  user_id    :integer          not null
#  content    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  url        :string
#

class Post < ApplicationRecord

  validates :title, :user_id, presence: true

  belongs_to :author,
    foreign_key: :user_id,
    class_name: 'User'

  has_many :sub_posts, inverse_of: :post

  has_many :subs,
    through: :sub_posts,
    source: :sub

  has_many :comments


end
