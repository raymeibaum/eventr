class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

	has_many :actions
	has_many :events, through: :actions

	def comments
		comments = []
		actions.where(activity_type: "Comment").each do |action|
			comments << action.activity
		end
		comments
	end

	def favorites
		favorites = []
		actions.where(activity_type: "Favorite").each do |action|
			favorites << action.activity
		end
		favorites
	end

	def add_favorite(event)
		favorite = Favorite.create

		action = Action.find_or_create_by(
			user_id: self.id,
			event_id: event.id,
			activity_id: favorite.id,
			activity_type: "Favorite"
			)
	end

	def remove_favorite(event)
		action = Action.find_by(
			event_id: event.id,
			user_id: self.id,
			activity_type: "Favorite"
			)

		favorite = action.activity
		favorite.delete
		action.delete
	end

	def has_favorite_for(event)
		actions.find_by(activity_type: "Favorite", event_id: event.id)
	end
end
