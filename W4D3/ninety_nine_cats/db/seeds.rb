# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Cat.destroy_all
CatRentalRequest.destroy_all
User.destroy_all

ApplicationRecord.connection.reset_pk_sequence!('cats')
ApplicationRecord.connection.reset_pk_sequence!('cat_rental_requests')
ApplicationRecord.connection.reset_pk_sequence!('users')

User.create([
  { username: 'starwars', password: 'starwars' },
  { username: 'xXxCodeGuyxXx', password: 'codingiscool' },
  { username: 'bob', password: 'bobbobbob' },
])

Cat.create([
  {
    birth_date: '2015/1/1', color: 'black', name: 'Jeremy', sex: 'M',
    description: 'Jeremy likes fish', user_id: 1
  },
  {
    birth_date: '2016/1/1', color: 'white', name: 'Fluffy', sex: 'F',
    description: 'Fluffy is fluffy', user_id: 2
  },
  {
    birth_date: '2017/1/1', color: 'orange', name: 'Jackson', sex: 'M',
    description: 'Jackson has a big head', user_id: 3
  }
])

CatRentalRequest.create([
  { cat_id: 1, user_id: 2, start_date: '2018/8/10', end_date: '2018/8/20' },
  { cat_id: 1, user_id: 3, start_date: '2018/7/3', end_date: '2018/8/3' },
  { cat_id: 2, user_id: 3, start_date: '2018/8/1', end_date: '2018/8/11' },
  { cat_id: 2, user_id: 1, start_date: '2018/8/10', end_date: '2018/8/20' },
  { cat_id: 3, user_id: 1, start_date: '2018/10/10', end_date: '2018/10/12' }
])
