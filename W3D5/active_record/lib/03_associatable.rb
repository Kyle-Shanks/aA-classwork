require_relative '02_searchable'
require 'active_support/inflector'

# Phase IIIa
class AssocOptions
  attr_accessor(
    :foreign_key,
    :class_name,
    :primary_key
  )

  def model_class
    eval(self.class_name)
  end

  def table_name
    self.model_class.table_name
  end
end

class BelongsToOptions < AssocOptions
  def initialize(name, options = {})
    @class_name = options[:class_name] || name.to_s.capitalize
    @foreign_key = options[:foreign_key] || "#{name.to_s}_id".to_sym
    @primary_key = options[:primary_key] || :id
  end
end

class HasManyOptions < AssocOptions
  def initialize(name, self_class_name, options = {})
    @class_name = options[:class_name] || name.to_s.singularize.capitalize
    @foreign_key = options[:foreign_key] || "#{self_class_name.to_s.downcase}_id".to_sym
    @primary_key = options[:primary_key] || :id
  end
end

module Associatable
  # Phase IIIb
  def belongs_to(name, options = {})
    obj = BelongsToOptions.new(name, options)
    self.assoc_options[name] = obj

    define_method(name) do
      result = obj.model_class.find(self.send(obj.foreign_key))
    end
  end

  def has_many(name, options = {})
    obj = HasManyOptions.new(name, self, options)
    define_method(name) do
      result = obj.model_class.where(obj.foreign_key => self.send(obj.primary_key))
    end
  end

  def assoc_options
    @assoc_options_hash ||= {}
  end
end

class SQLObject
  extend Associatable
end
