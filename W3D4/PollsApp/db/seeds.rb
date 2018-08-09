# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Poll.destroy_all
Question.destroy_all
AnswerChoice.destroy_all
Response.destroy_all

ApplicationRecord.connection.reset_pk_sequence!('users')
ApplicationRecord.connection.reset_pk_sequence!('polls')
ApplicationRecord.connection.reset_pk_sequence!('questions')
ApplicationRecord.connection.reset_pk_sequence!('answer_choices')
ApplicationRecord.connection.reset_pk_sequence!('responses')

User.create([
  { username: 'Kyle' },
  { username: 'James' },
  { username: 'Benji' },
  { username: 'Brandon' },
  { username: 'Claire' },
  { username: 'Brian' },
  { username: 'Andrew' },
  { username: 'xXxSuPeRcOoL420MaNxXx' }
])

Poll.create([
  { title: 'Pets', user_id: 2 },
  { title: 'Foods', user_id: 4 },
  { title: 'Video Games', user_id: 1 }
])

Question.create([
  { text: 'Cats or dogs?', poll_id: Poll.find_by(title: 'Pets').id },
  { text: 'Hamsters or chinchillas?', poll_id: Poll.find_by(title: 'Pets').id },
  { text: 'Burger or Pizza?', poll_id: Poll.find_by(title: 'Foods').id },
  { text: 'Pineapple on Pizza; yes or no?', poll_id: Poll.find_by(title: 'Foods').id },
  { text: 'RPG or Action?', poll_id: Poll.find_by(title: 'Video Games').id },
  { text: 'Dragonball or Tekken?', poll_id: Poll.find_by(title: 'Video Games').id }
])

AnswerChoice.create([
  { text: 'Cat', question_id: Question.find_by(text: 'Cats or dogs?').id },
  { text: 'Dog', question_id: Question.find_by(text: 'Cats or dogs?').id },
  { text: 'Hamster', question_id: Question.find_by(text: 'Hamsters or chinchillas?').id },
  { text: 'Chinchilla', question_id: Question.find_by(text: 'Hamsters or chinchillas?').id },
  { text: 'Burger', question_id: Question.find_by(text: 'Burger or Pizza?').id },
  { text: 'Pizza', question_id: Question.find_by(text: 'Burger or Pizza?').id },
  { text: 'Yes', question_id: Question.find_by(text: 'Pineapple on Pizza; yes or no?').id },
  { text: 'No', question_id: Question.find_by(text: 'Pineapple on Pizza; yes or no?').id },
  { text: 'RPG', question_id: Question.find_by(text: 'RPG or Action?').id },
  { text: 'Action', question_id: Question.find_by(text: 'RPG or Action?').id },
  { text: 'Dragonball', question_id: Question.find_by(text: 'Dragonball or Tekken?').id },
  { text: 'Tekken', question_id: Question.find_by(text: 'Dragonball or Tekken?').id }
])

Response.create([
  { answer_choice_id: 1, user_id: 1 },
  { answer_choice_id: 2, user_id: 2 },
  { answer_choice_id: 5, user_id: 3 },
  { answer_choice_id: 4, user_id: 6 },
  { answer_choice_id: 6, user_id: 7 },
  { answer_choice_id: 5, user_id: 8 },
  { answer_choice_id: 2, user_id: 4 },
  { answer_choice_id: 8, user_id: 5 }
])
