class Comment < ApplicationRecord

  validates :content, :user_id, :post_id, presence: true

  belongs_to :parent_comment,
    foreign_key: :parent_comment_id,
    class_name: 'Comment',
    optional: true

  has_many :sub_comments,
    foreign_key: :parent_comment_id,
    class_name: 'Comment'

  belongs_to :post

  belongs_to :author,
    foreign_key: :user_id,
    class_name: :User

end
