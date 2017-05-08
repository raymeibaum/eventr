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

	def categories
		@categories = Event.get_categories

		render json: @categories
	end

	def show
		@event = Event.load_event(params[:id])
		# @comments = @event.comments

		# render json: {event: @event, comments: @comments }, status: :ok

		@event ? (render json: @event) :(render json: {status: 404, message: "Event not found."})

	end

	def comments
		@event = Event.load_event(params[:id])
		@comments = @event.comments
	end
end
