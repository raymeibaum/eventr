class Api::FavoritesController < ApplicationController

	def create
		# action = Action.find_by(user_id: current_user.id, event_id: params[:event_id], activity_type: "Favorite")
		event = Event.find_or_create_by(event_id: params[:event_id])
		current_user.add_favorite(event) # if action.blank?

		render json: {favorite: true}
	end

	def destroy
		event = Event.find_by(event_id: params[:event_id])
		current_user.remove_favorite(event)

		render json: {favorite: false}
	end
end
