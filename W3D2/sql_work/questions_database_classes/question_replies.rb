require_relative "model_base"

class QuestionReply < ModelBase
  def self.find_by_user_id(author_id)
    data = QuestionsDatabase.instance.execute(<<-SQL, author_id)
      SELECT *
      FROM replies
      WHERE user_id = ?
    SQL
    data.map { |hash| QuestionReply.new(hash) }
  end

  def self.find_by_user_id(q_id)
    data = QuestionsDatabase.instance.execute(<<-SQL, q_id)
      SELECT *
      FROM replies
      WHERE question_id = ?
    SQL
    data.map { |hash| QuestionReply.new(hash) }
  end

  attr_reader :id
  attr_accessor :question_id, :body, :parent_reply_id, :user_id

  def initialize(hash)
    @id = hash['id']
    @question_id = hash['question_id']
    @body = hash['body']
    @parent_reply_id = hash['parent_reply_id']
    @user_id = hash['user_id']
  end

  def author
    data = QuestionsDatabase.instance.execute(<<-SQL, @user_id)
      SELECT *
      FROM users
      WHERE id = ?
    SQL
    User.new(data[0])
  end

  def question
    data = QuestionsDatabase.instance.execute(<<-SQL, @question_id)
      SELECT *
      FROM questions
      WHERE id = ?
    SQL
    Question.new(data[0])
  end

  def parent_reply
    data = QuestionsDatabase.instance.execute(<<-SQL, @parent_reply_id)
      SELECT *
      FROM replies
      WHERE id = ?
    SQL
    QuestionReply.new(data[0])
  end

  def child_replies
    data = QuestionsDatabase.instance.execute(<<-SQL, @id)
      SELECT *
      FROM replies
      WHERE parent_reply_id = ?
    SQL
    data.map { |hash| QuestionReply.new(hash) }
  end

  def save
    if @id
      # UPDATE
      QuestionsDatabase.instance.execute(<<-SQL, @question_id, @body, @parent_reply_id, @user_id, @id)
        UPDATE
          replies
        SET
          question_id = ?, body = ?, parent_reply_id = ?, user_id = ?
        WHERE
          id = ?
      SQL
      true
    else
      #INSERT
      QuestionsDatabase.instance.execute(<<-SQL, @question_id, @body, @parent_reply_id, @user_id)
        INSERT INTO
          replies(question_id, body, parent_reply_id, user_id)
        VALUES
          (?, ?, ?, ?)
      SQL
      @id = QuestionsDatabase.instance.last_insert_row_id
    end
  end
end
