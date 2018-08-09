class Response < ApplicationRecord
  validates :user_id, presence: true
  validates :answer_choice_id, presence: true
  validate :not_duplicate_response
  validate :not_answered_by_author

  belongs_to :respondent,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: "User"

  belongs_to :answer,
    primary_key: :id,
    foreign_key: :answer_choice_id,
    class_name: "AnswerChoice"

  has_one :question,
    through: :answer,
    source: :question




  def sibling_responses
    self.question.responses.where.not(id: self.id)
  end

  def respondent_already_answered?
    self.sibling_responses.exists?(user_id: self.user_id)
  end

  def respondent_is_author?
    self.question.poll.user_id == self.user_id
  end

  private

  def not_duplicate_response
    if respondent_already_answered?
      errors[:user_id] << 'respondent has already answered'
    end
  end

  def not_answered_by_author
    if self.respondent_is_author?
      errors[:user_id] << 'author cannot answer own question'
    end
  end

end
