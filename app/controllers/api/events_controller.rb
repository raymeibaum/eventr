class Api::EventsController < ApplicationController
	def events
		@events = Event.get_events(params[:latlng], params[:category])

		render json: @events
	end
	def categories
		@categories = Event.get_categories()

		render json: @categories
	end
end
