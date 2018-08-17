class Comment < ApplicationRecord
  validates :user_id, :goal_id, :body, presence: true

  belongs_to :goal
  belongs_to :user 
end
