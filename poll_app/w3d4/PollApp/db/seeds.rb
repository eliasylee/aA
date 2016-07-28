# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(user_name: 'Eric')
User.create(user_name: 'Eli')
User.create(user_name: 'Bob')

Poll.create(title: 'Climbing Poll', author_id: 1)
Poll.create(title: 'Computer Poll', author_id: 2)

Question.create(text: 'What day?', poll_id: 1)
Question.create(text: 'Where?', poll_id: 1)
Question.create(text: 'What OS?', poll_id: 2)

AnswerChoice.create(text: 'Saturday', question_id: 1)
AnswerChoice.create(text: 'Sunday', question_id: 1)
AnswerChoice.create(text: 'Dogpatch', question_id: 2)
AnswerChoice.create(text: 'Mission Cliffs', question_id: 2)
AnswerChoice.create(text: 'Linux', question_id: 3)
AnswerChoice.create(text: 'OSX', question_id: 3)

Response.create(user_id: 1, answer_choice_id: 1)
Response.create(user_id: 1, answer_choice_id: 3)
Response.create(user_id: 1, answer_choice_id: 5)

Response.create(user_id: 2, answer_choice_id: 1)
Response.create(user_id: 2, answer_choice_id: 4)
Response.create(user_id: 2, answer_choice_id: 5)

Response.create(user_id: 3, answer_choice_id: 2)
Response.create(user_id: 3, answer_choice_id: 3)
Response.create(user_id: 3, answer_choice_id: 6)
