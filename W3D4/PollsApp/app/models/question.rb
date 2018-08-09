class Question < ApplicationRecord
  validates :text, presence: true
  validates :poll_id, presence: true

  belongs_to :poll,
    primary_key: :id,
    foreign_key: :poll_id,
    class_name: 'Poll'

  has_many :answer_choices,
    primary_key: :id,
    foreign_key: :question_id,
    class_name: 'AnswerChoice'

  has_many :responses,
    through: :answer_choices,
    source: :responses


  def results
    # count= Hash.new(0)
    # responses.each do |res|
    #   count[res.answer.text] += 1
    # end
    #
    # count

    # a = Response.all.joins(:answer).group('answer_choices.id').select('answer_choices.text, COUNT(*) as num')

  end
end
