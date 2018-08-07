require_relative "model_base"

class Question < ModelBase
  def self.find_by_author_id(author_id)
    data = QuestionsDatabase.instance.execute(<<-SQL, author_id)
      SELECT *
      FROM questions
      WHERE user_id = ?
    SQL
    data.map { |hash| Question.new(hash) }
  end

  def self.most_followed(n)
    QuestionFollow.most_followed_questions(n)
  end

  def self.most_liked(n)
    QuestionLike.most_liked_questions(n)
  end

  attr_reader :id
  attr_accessor :title, :body, :user_id

  def initialize(hash)
    @id = hash['id']
    @title = hash['title']
    @body = hash['body']
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

  def replies
    data = QuestionsDatabase.instance.execute(<<-SQL, @id)
      SELECT *
      FROM replies
      WHERE question_id = ?
    SQL
    data.map { |hash| QuestionReply.new(hash) }
  end

  def followers
    QuestionFollow.followers_for_question_id(@id)
  end

  def likers
    QuestionLike.likers_for_question_id(@id)
  end

  def num_likers
    QuestionLike.num_likes_for_question_id(@id)
  end

  def save
    if @id
      # UPDATE
      QuestionsDatabase.instance.execute(<<-SQL, @title, @body, @user_id, @id)
        UPDATE
          questions
        SET
          title = ?, body = ?, user_id = ?
        WHERE
          id = ?
      SQL
      true
    else
      #INSERT
      QuestionsDatabase.instance.execute(<<-SQL, @title, @body, @user_id)
        INSERT INTO
          questions(title, body, user_id)
        VALUES
          (?, ?, ?)
      SQL
      @id = QuestionsDatabase.instance.last_insert_row_id
    end
  end
end
