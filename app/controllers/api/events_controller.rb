class Api::EventsController < ApplicationController
	def events_for_category
		@events = Event.get_events(params[:latlng], params[:id])

		@events ? (render json: @events) :
		(render json: {status: 404, message: "No events found."})
	end

	def events_all
		@events = Event.get_events(params[:latlng])

		@events ? (render json: @events) :
		(render json: {status: 404, message: "No events found."})
	end

	def create
		event = Event.find_or_create_by(event_id: params[:id])
		event.save_as_favorite_for(current_user)
		binding.pry
	end

	def categories
		@categories = Event.get_categories

		render json: @categories
	end

	def show
		@event = Event.get_event(params[:id])

		@event ? (render json: @event) :(render json: {status: 404, message: "Event not found."})

	end

	def comments
		@event = Event.load_event(params[:id])
		@comments = @event.comments
	end
end
