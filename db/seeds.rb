# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Event.delete_all
Comment.delete_all
Favorite.delete_all
Action.delete_all

event = Event.create(event_id: "E0-001-100209578-1")

favorite = Favorite.create

comment = Comment.create(title: "hey i'm a comment", content: "here's the comment's content")
comment_2 = Comment.create(title: "hey 2nd comment", content: "here's 2nd comment")

comment_action = Action.create(user_id: 1, event_id: event.id, activity_id: comment.id, activity_type: "Comment")
favorite_action = Action.create(user_id: 1, event_id: event.id, activity_id: favorite.id, activity_type: "Favorite")
comment_action_2 = Action.create(user_id: 1, event_id: event.id, activity_id: comment_2.id, activity_type: "Comment")
