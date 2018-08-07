require_relative "model_base"

class QuestionLike < ModelBase
  def self.likers_for_question_id(q_id)
    data = QuestionsDatabase.instance.execute(<<-SQL, q_id)
      SELECT user_id
      FROM question_likes
      WHERE question_id = ?
    SQL
    data.map { |hash| User.find_by_id(hash['user_id']) }
  end

  def self.num_likes_for_question_id(q_id)
    data = QuestionsDatabase.instance.execute(<<-SQL, q_id)
      SELECT *
      FROM question_likes
      WHERE question_id = ?
    SQL
    data.length
  end

  def self.liked_questions_for_user_id(u_id)
    data = QuestionsDatabase.instance.execute(<<-SQL, u_id)
      SELECT question_id
      FROM question_likes
      WHERE user_id = ?
    SQL
    data.map { |hash| Question.find_by_id(hash['question_id']) }
  end

  def self.most_liked_questions(n)
    data = QuestionsDatabase.instance.execute(<<-SQL, n)
      SELECT question_id
      FROM question_likes
      GROUP BY question_id
      ORDER BY COUNT(user_id) DESC
      LIMIT ?
    SQL
    data.map { |hash| Question.find_by_id(hash['question_id']) }
  end


  attr_reader :id
  attr_accessor :question_id, :user_id

  def initialize(hash)
    @id = hash['id']
    @question_id = hash['question_id']
    @user_id = hash['user_id']
  end

  def save
    if @id
      # UPDATE
      QuestionsDatabase.instance.execute(<<-SQL, @question_id, @user_id, @id)
        UPDATE
          question_likes
        SET
          question_id = ?, user_id = ?
        WHERE
          id = ?
      SQL
      true
    else
      #INSERT
      QuestionsDatabase.instance.execute(<<-SQL, @question_id, @user_id)
        INSERT INTO
          question_likes(question_id, user_id)
        VALUES
          (?, ?)
      SQL
      @id = QuestionsDatabase.instance.last_insert_row_id
    end
  end
end
