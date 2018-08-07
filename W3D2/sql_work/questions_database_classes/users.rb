require_relative "model_base"

class User < ModelBase
  # Fix to handle single argument searches
  def self.find_by_name(user_fname, user_lname)
    data = QuestionsDatabase.instance.execute(<<-SQL, user_fname, user_lname)
      SELECT *
      FROM users
      WHERE fname = ? AND lname = ?
    SQL
    data.map { |hash| User.new(hash) }
  end

  attr_reader :id
  attr_accessor :fname, :lname

  def initialize(hash)
    @id = hash['id']
    @fname = hash['fname']
    @lname = hash['lname']
  end

  def authored_questions
    Question.find_by_author_id(@id)
  end

  def authored_replies
    QuestionReplies.find_by_user_id(@id)
  end

  def followed_questions
    QuestionFollow.followed_questions_for_user_id(@id)
  end

  def liked_questions
    QuestionLike.liked_questions_for_user_id(@id)
  end

  # Just cause
  # def average_karma
  #   total_q = authored_questions
  #   total_likes = total_q.map { |q| q.num_likers }.reduce(:+)
  #   total_likes/(total_q.length).to_f
  # end

  def average_karma
    data = QuestionsDatabase.instance.execute(<<-SQL, @id)
      SELECT CAST(SUM(b.like_count)/COUNT(*) AS FLOAT) AS average
      FROM
        ( SELECT id
          FROM questions
          WHERE user_id = ? ) a
      JOIN
        ( SELECT question_id, COUNT(id) as like_count
          FROM question_likes
          GROUP BY question_id ) b
      ON a.id = b.question_id
    SQL
    data[0]['average']
  end

  def save
    if @id
      # UPDATE
      QuestionsDatabase.instance.execute(<<-SQL, @fname, @lname, @id)
        UPDATE
          users
        SET
          fname = ?, lname = ?
        WHERE
          id = ?
      SQL
      true
    else
      #INSERT
      QuestionsDatabase.instance.execute(<<-SQL, @fname, @lname)
        INSERT INTO
          users(fname, lname)
        VALUES
          (?, ?)
      SQL
      @id = QuestionsDatabase.instance.last_insert_row_id
    end
  end
end
