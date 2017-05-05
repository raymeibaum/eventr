class Api::EventsController < ApplicationController
	def events
		@events = Event.get_events(params[:latlng], params[:category])

		render json: @events
	end
	def categories
		@categories = Event.get_categories()

		render json: @categories
	end

	def show
		@event = Event.show_event(params[:id])

		@event ? (render json: @event) :
		(render json: {status: 404, message: "User not found."})
	end
end
