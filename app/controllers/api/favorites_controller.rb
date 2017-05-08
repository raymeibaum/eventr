class Api::FavoritesController < ApplicationController

	def create
		event = Event.find_or_create_by(event_id: params[:event_id])
		event.save_as_favorite_for(current_user)

		render json: {status: 201, message: "Event favorited."}
	end

end
