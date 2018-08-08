# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

jeff = User.create(name: 'Jeff', email:"fhskufene.com")
benji = User.create(name: 'Benji', email:"benji.com")
ryan = User.create(name: 'Ryan', email:"ryan.com")
kyle = User.create(name: 'Kyle', email:"kyle.com")

ShortenedUrl.make_short(kyle,'sfkufgeukbfjefsjkshf.com')
ShortenedUrl.make_short(benji,'qwjfsbfjesybfse.com')
ShortenedUrl.make_short(benji,'cnjdshfsukd135.com')
ShortenedUrl.make_short(benji,'541225.com')
ShortenedUrl.make_short(ryan,'fsecncnc.com')
ShortenedUrl.make_short(kyle,'46892354643435483431534684886cdjsvcdgsvd.com')
