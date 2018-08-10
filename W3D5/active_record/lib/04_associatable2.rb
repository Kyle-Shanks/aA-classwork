require_relative '03_associatable'

# Phase IV
module Associatable
  # Remember to go back to 04_associatable to write ::assoc_options

  def has_one_through(name, through_name, source_name)

    obj1 = self.assoc_options[through_name] # Connection from Cat to Human
    obj2 = obj1.model_class.assoc_options[source_name] # Connection from Human to House

    define_method(name) do
      mid = obj1.model_class.find(self.send(obj1.foreign_key))
      result = obj2.model_class.find(mid.send(obj2.foreign_key))
    end

    # Need to make this one query instead of two
    # Use a joins like below: 

    # query = <<-SQL
    #   SELECT
    #     houses.*
    #   FROM
    #     humans
    #   JOIN
    #     houses ON humans.house_id = houses.id
    #   WHERE
    #     humans.id = ?
    # SQL

  end
end
