# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Band.destroy_all
Album.destroy_all
Track.destroy_all

ApplicationRecord.connection.reset_pk_sequence!('users')
ApplicationRecord.connection.reset_pk_sequence!('bands')
ApplicationRecord.connection.reset_pk_sequence!('albums')
ApplicationRecord.connection.reset_pk_sequence!('tracks')

User.create([
  { username: 'Bob', email: 'bob@builders.com', password: 'bobthebuilder' },
  { username: 'Rob', email: 'rob@builders.com', password: 'robthebuilder' },
  { username: 'Bryan', email: 'bryanlee@omalley.com', password: 'bryanleeomalley' }
])

Band.create ([
  { name: 'Sex Bob-omb' },
  { name: 'Crash & the Boys' },
  { name: 'The Clash at Demonhead' }
])

Album.create ([
  { title: 'Sex Bob-omb', year: 2008, live_album: true, band_id: 1 },
  { title: 'Arnold & Co.', year: 2002, live_album: false, band_id: 2 },
  { title: 'Mr. Squaresponge', year: 2013, live_album: true, band_id: 2 }
])

Track.create ([
  { title: 'Launchpad McQuack', ord: 1, album_id: 1, bonus_track: false, lyrics: '' },
  { title: 'Threshold', ord: 2, album_id: 1, bonus_track: false, lyrics: '' },
  { title: 'Garbage Truck', ord: 3, album_id: 1, bonus_track: false, lyrics: '' },
  { title: 'We Are Sex- Bob-omb!', ord: 4, album_id: 1, bonus_track: true, lyrics: '' },
  { title: 'Banana Man', ord: 1, album_id: 2, bonus_track: false, lyrics: '' },
  { title: 'Football Head', ord: 2, album_id: 2, bonus_track: false, lyrics: '' },
  { title: 'Gerald is the man', ord: 3, album_id: 2, bonus_track: false, lyrics: '' },
  { title: 'Ripped Pants', ord: 1, album_id: 3, bonus_track: false, lyrics: '' },
  { title: 'Starman', ord: 2, album_id: 3, bonus_track: true, lyrics: '' },
])
