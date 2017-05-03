class Api::EventsController < ApplicationController
	def index
		@events = Event.get_events()

		render json: @events
	end
	def show

	end
end
