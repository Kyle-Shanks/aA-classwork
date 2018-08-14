# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Cat.destroy_all
CatRentalRequest.destroy_all

ApplicationRecord.connection.reset_pk_sequence!('cats')
ApplicationRecord.connection.reset_pk_sequence!('cat_rental_requests')

Cat.create([
  {
    name: 'Smokey', color: 'Grey', sex: 'M', birth_date: '2013/01/20',
    description: 'Stimulate your mind man!'
  },
  {
    name: 'Craig', color: 'Light Grey', sex: 'M', birth_date: '2011/01/20',
    description: 'One tough cat'
  },
  {
    name: 'Priscilla', color: 'Black', sex: 'F', birth_date: '2015/01/20',
    description: 'Boots and stuff'
  },
  {
    name: 'Finn', color: 'White', sex: 'M', birth_date: '2015/01/20',
    description: 'Mathmatical!'
  },
  {
    name: 'Jake', color: 'Orange', sex: 'M', birth_date: '2016/01/20',
    description: 'Rhombus!'
  },
  {
    name: 'Miki', color: 'White', sex: 'F', birth_date: '2012/01/20',
    description: 'Miki likes fish'
  },
  {
    name: 'Arnold', color: 'Orange', sex: 'M', birth_date: '2008/01/20',
    description: 'Catinator'
  },
  {
    name: 'Gumball', color: 'Grey', sex: 'F', birth_date: '2014/01/20',
    description: 'Sup'
  },
  {
    name: 'Fluffington', color: 'Light Grey', sex: 'M', birth_date: '2017/01/20',
    description: 'Mewmewmewmew'
  },
])

CatRentalRequest.create([
  { cat_id: 6, start_date: '2018/8/15', end_date: '2018/8/22' },
  { cat_id: 6, start_date: '2018/8/20', end_date: '2018/8/22' },
  { cat_id: 6, start_date: '2018/8/20', end_date: '2018/8/27' },
  { cat_id: 6, start_date: '2018/8/10', end_date: '2018/8/22' },
  { cat_id: 6, start_date: '2018/9/20', end_date: '2018/9/22' },
  { cat_id: 6, start_date: '2018/10/15', end_date: '2018/10/22' },
  { cat_id: 3, start_date: '2018/9/10', end_date: '2018/9/22' },
  { cat_id: 5, start_date: '2018/10/11', end_date: '2018/11/23' },
  { cat_id: 5, start_date: '2018/11/15', end_date: '2018/11/22' },
  { cat_id: 7, start_date: '2018/9/15', end_date: '2018/9/22' },
  { cat_id: 2, start_date: '2018/9/15', end_date: '2018/10/22' },
  { cat_id: 1, start_date: '2018/8/15', end_date: '2018/8/22' },
  { cat_id: 8, start_date: '2018/8/15', end_date: '2018/8/22' },
  { cat_id: 9, start_date: '2018/8/15', end_date: '2018/8/22' }
])
