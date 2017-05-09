class Comment < ApplicationRecord
	has_many :actions, as: :activity

	# def self.create_comment(title, content, user, event)
	# 	comment = Comment.create(title: title, content: content)
	# 	comment_action = Action.create(user_id: user.id, event_id: event.id, activity_id: comment.id, activity_type: "Comment")
	# end

end
