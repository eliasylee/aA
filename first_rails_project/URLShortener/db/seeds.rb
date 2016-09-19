# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

TagTopic.create!({topic: 'music'})
TagTopic.create!({topic: 'gaming'})
TagTopic.create!({topic: 'books'})
TagTopic.create!({topic: 'sports'})
TagTopic.create!({topic: 'technology'})
TagTopic.create!({topic: 'farming'})

User.create!({email: 'aaa@gmail.com'})
User.create!({email: 'bbb@yahoo.com'})
User.create!({email: 'ccc@hotmail.com'})

ShortenedURL.create!({long_url: "asdf", short_url: ShortenedURL.random_code, user_id: 1})
ShortenedURL.create!({long_url: "asdfasdf", short_url: ShortenedURL.random_code, user_id: 2})
ShortenedURL.create!({long_url: "asdfasdfasdf", short_url: ShortenedURL.random_code, user_id: 3})

Visit.create!({user_id: 1, url_id: 1 })
Visit.create!({user_id: 1, url_id: 1 })
Visit.create!({user_id: 1, url_id: 1 })

Visit.create!({user_id: 2, url_id: 1 })
Visit.create!({user_id: 2, url_id: 2 })
Visit.create!({user_id: 2, url_id: 1 })

Visit.create!({user_id: 3, url_id: 1 })
Visit.create!({user_id: 3, url_id: 2 })
Visit.create!({user_id: 3, url_id: 2 })

Tagging.create!({url_id: 1, tag_id: 3})
Tagging.create!({url_id: 1, tag_id: 1})
Tagging.create!({url_id: 2, tag_id: 1})
Tagging.create!({url_id: 2, tag_id: 2})
Tagging.create!({url_id: 3, tag_id: 5})
Tagging.create!({url_id: 3, tag_id: 6})
