# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create!(username: 'bobinator')
User.create!(username: 'halilinator')
User.create!(username: 'elinator')
User.create!(username: 'sallynator')
User.create!(username: 'sarahnator')

Contact.create!(name:'bob', email:'bob@email.com', user_id: 1)
Contact.create!(name:'halil', email:'halil@email.com', user_id: 2)
Contact.create!(name:'eli', email:'eli@email.com', user_id: 3)
Contact.create!(name:'sally', email:'sally@email.com', user_id: 4)
Contact.create!(name:'sarah', email:'sarah@email.com', user_id: 5)

ContactShare.create!(user_id: 2, contact_id: 1)
ContactShare.create!(user_id: 3, contact_id: 1)
ContactShare.create!(user_id: 4, contact_id: 1)
ContactShare.create!(user_id: 5, contact_id: 1)

ContactShare.create!(user_id: 3, contact_id: 2)
ContactShare.create!(user_id: 4, contact_id: 3)
ContactShare.create!(user_id: 5, contact_id: 4)

ContactShare.create!(user_id: 1, contact_id: 2)
ContactShare.create!(user_id: 1, contact_id: 3)
ContactShare.create!(user_id: 1, contact_id: 4)
ContactShare.create!(user_id: 1, contact_id: 5)
