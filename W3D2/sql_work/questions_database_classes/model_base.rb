require_relative "questions_db_class"

class ModelBase

  def self.all
    data = QuestionsDatabase.instance.execute(<<-SQL)
      SELECT *
      FROM #{table}
    SQL
    data.map { |hash| self.new(hash) }
  end

  def self.find_by_id(search_id)
    data = QuestionsDatabase.instance.execute(<<-SQL, search_id)
      SELECT *
      FROM #{table}
      WHERE id = ?
    SQL
    self.new(data[0])
  end

  def self.table
    hash = {
      "QuestionFollow" => "question_follows",
      "QuestionLike" => "question_likes",
      "QuestionReply" => "replies",
      "Question" => "questions",
      "User" => "users"
    }

    hash[self.to_s]
  end

  def get_variable_hash
    i_variables = self.instance_variables
    keys = i_variables.map { |sym| sym.to_s.gsub('@','') }
    values = i_variables.map { |sym| self.instance_variable_get(sym.to_s) }
    keys.zip(values).to_h
  end

  def save
    vh = get_variable_hash
    if vh['id']
      # UPDATE
      set_statement = vh.reject{|k,v| k=="id"}.map{ |k,v| "#{k} = \'#{v}\'"}.join(", ")

      QuestionsDatabase.instance.execute(<<-SQL)
        UPDATE
          #{self.class.table}
        SET
          #{set_statement}
        WHERE
          id = #{vh["id"]}
      SQL
      true
    else
      #INSERT
      QuestionsDatabase.instance.execute(<<-SQL)
        INSERT INTO
          #{self.class.table} (#{vh.keys.join(", ")})
        VALUES
          (#{ vh.values.join(", ") })
      SQL
      self.id = QuestionsDatabase.instance.last_insert_row_id
    end
  end

  #
  # def initialize
  # end
  #
  # def save
  # end

end
