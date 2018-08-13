# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Artwork.destroy_all
ArtworkShare.destroy_all

ApplicationRecord.connection.reset_pk_sequence!('users')
ApplicationRecord.connection.reset_pk_sequence!('artworks')
ApplicationRecord.connection.reset_pk_sequence!('artwork_shares')

User.create([
  { username: 'Kyle' },
  { username: 'Andy' },
  { username: 'Benji' },
  { username: 'Brandon' }
])

Artwork.create([
  { title: 'Pets', artist_id: 2, image_url: 'http://www.knowmycotoxins.com/sites/default/files/images/pets.jpg' },
  { title: 'Gnocchi', artist_id: 1, image_url: 'https://www.simplyrecipes.com/wp-content/uploads/2012/01/pumpkin-ricotta-gnocchi-horiz-a-1800.jpg' },
  { title: 'Sushi', artist_id: 2, image_url: 'https://img.grouponcdn.com/deal/2CtR2S65oxsqAcBUNaoozYpvjnnW/2C-2048x1229/v1/c700x420.jpg' },
  { title: 'Bird', artist_id: 3, image_url: 'https://orig00.deviantart.net/ea58/f/2013/128/f/1/tumblr_mbhvx6bwxc1rwadubo1_1280_by_huatunan-d64ipyu.jpg' },
  { title: 'Football', artist_id: 4, image_url: 'https://usatcollege.files.wordpress.com/2017/01/1404735510000-sb10066898ab-001-1.jpg?w=1000&h=667' }
])

ArtworkShare.create([
  { artwork_id: 1, viewer_id: 1 },
  { artwork_id: 1, viewer_id: 2 },
  { artwork_id: 1, viewer_id: 3 },
  { artwork_id: 2, viewer_id: 2 },
  { artwork_id: 2, viewer_id: 3 },
  { artwork_id: 2, viewer_id: 1 },
  { artwork_id: 3, viewer_id: 1 },
  { artwork_id: 3, viewer_id: 2 },
  { artwork_id: 3, viewer_id: 4 },
  { artwork_id: 3, viewer_id: 3 },
  { artwork_id: 4, viewer_id: 3 },
  { artwork_id: 4, viewer_id: 1 },
  { artwork_id: 5, viewer_id: 4 },
  { artwork_id: 5, viewer_id: 3 },
  { artwork_id: 5, viewer_id: 2 },
  { artwork_id: 5, viewer_id: 1 }
])
