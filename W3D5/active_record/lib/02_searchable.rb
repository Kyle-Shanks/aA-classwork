require_relative 'db_connection'
require_relative '01_sql_object'

module Searchable
  def where(params)
    where_str = ""
    params.each { |k,v| where_str += "#{k} = ? AND " }
    where_str = where_str[0..-6]

    data = DBConnection.execute(<<-SQL, *params.values)
      SELECT
        *
      FROM
        #{self.table_name}
      WHERE
        #{where_str}
    SQL

    self.parse_all(data)
  end
end

class SQLObject
  # Mixin Searchable here...
  extend Searchable
end
