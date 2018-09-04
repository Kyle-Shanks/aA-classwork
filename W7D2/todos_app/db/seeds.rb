# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Todo.destroy_all

ApplicationRecord.connection.reset_pk_sequence!('todos')

Todo.create([
  { title: 'eat Triscuit', body: 'eat to beat hunger', done: false },
  { title: 'eat Chocopies', body: 'eat to be fat', done: false },
  { title: 'eat Hichews', body: 'eat to enjoy life', done: false }
])
