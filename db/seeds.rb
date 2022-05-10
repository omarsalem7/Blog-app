# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
first_user = User.create(name: 'Tom', photo: 'https://image.shutterstock.com/image-vector/man-character-face-avatar-glasses-600w-542759665.jpg', bio: 'Teacher from Mexico.')
second_user = User.create(name: 'Lilly', photo: 'https://image.shutterstock.com/image-vector/female-face-avatar-on-white-600w-562359607.jpg', bio: 'Teacher from Poland.')

first_post = Post.create(user: first_user, title: 'Hello1', text: 'This is first post')
second_post = Post.create(user: first_user, title: 'Hello2', text: 'This issecond post')
third_post = Post.create(user: second_user, title: 'Hello3', text: 'This isthird post')
fourth_post = Post.create(user: second_user, title: 'Hello4', text: 'This is fourth post')

Comment.create(post: first_post, user: second_user, text: 'Hi Tom!' )
Comment.create(post: first_post, user: first_user, text: 'Hi omar!' )
Comment.create(post: second_post, user: second_user, text: 'Hi , this is my first comment' )
Comment.create(post: second_post, user: second_user, text: 'Hi , this is my second comment' )

Like.create(post: first_post, user: second_user)
Like.create(post: second_post, user: first_user)

puts 'Seed data loaded successfully'