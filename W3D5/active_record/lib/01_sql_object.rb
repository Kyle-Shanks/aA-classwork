require_relative 'db_connection'
require 'active_support/inflector'
# NB: the attr_accessor we wrote in phase 0 is NOT used in the rest
# of this project. It was only a warm up.

class SQLObject
  def self.columns
    return @columns if @columns
    data = DBConnection.execute2(<<-SQL)
      SELECT *
      FROM #{self.table_name}
    SQL
    @columns = data[0].map(&:to_sym)
  end

  def self.finalize!
    self.columns.each do |column|
      # Getter
      define_method(column) do
        self.attributes[column]
      end
      # Setter
      define_method("#{column}=") do |val|
        self.attributes
        @attributes[column] = val
      end
    end
  end

  def self.table_name=(table_name)
    @table_name = table_name
  end

  def self.table_name
    @table_name || self.to_s.tableize
  end

  def self.all
    data = DBConnection.execute(<<-SQL)
      SELECT *
      FROM #{self.table_name}
    SQL
    self.parse_all(data)
  end

  def self.parse_all(results)
    results.map { |row| self.new(row) }
  end

  def self.find(id)
    data = DBConnection.execute(<<-SQL, id)
      SELECT *
      FROM #{self.table_name}
      WHERE id = ?
    SQL
    data.empty? ? nil : self.new(data[0])
  end

  def initialize(params = {})
    params.each do |k,v|
      raise "unknown attribute '#{k}'" unless self.class.columns.include?(k.to_sym)
      self.send("#{k}=",v)
    end
  end

  def attributes
    @attributes ||= {}
  end

  def attribute_values
    self.attributes.values
  end

  def insert
    attrs = self.attributes
    keys = attrs.keys

    DBConnection.execute(<<-SQL, *attrs.values)
      INSERT INTO
        #{self.class.table_name}(#{keys.join(", ")})
      VALUES
        (#{(["?"]*keys.length).join(", ")})
    SQL
    self.id = DBConnection.last_insert_row_id
  end

  def update
    attrs = self.attributes.reject { |k,v| k == :id }
    set_str = ""
    attrs.each { |k,v| set_str += "#{k} = ?, " }
    set_str = set_str[0..-3]

    DBConnection.execute(<<-SQL, *attrs.values)
      UPDATE
        #{self.class.table_name}
      SET
        #{set_str}
      WHERE
        id = #{self.id}
    SQL
    true
  end

  def save
    self.id ? self.update : self.insert
  end
end

class Cat < SQLObject
  finalize!
end

class Human < SQLObject
  self.table_name = "humans"
  finalize!
end
