# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user = User.create(username: "user1", password: "123456")
sub1 = Sub.create(title: "ruby on rails", description: "learning the program", user_id: user.id)
post1 = Post.create(title: "rails", url: "rails_url", content: "it's on quick models and controllers commands", user_id: user.id, sub_id: sub1.id)