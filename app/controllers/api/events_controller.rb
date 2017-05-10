class Api::EventsController < ApplicationController
	def events_with_specifics
		@events = Event.get_events(params[:latlng], params[:id], params[:date])

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
		@event = Event.find_or_create_by(event_id: params[:id])
		@eventful = Event.get_event(params[:id])
		@comments = @event.comments

		@event ? (render json: {event: @event, eventful: @eventful, comments: @comments}) :(render json: {status: 404, message: "Event not found."})

	end

	def favorite_or_comment
		event = Event.find_or_create_by(event_id: params[:id])
		if params[:comment]
			event.add_comment(params[:title], param[:content], current_user)
		else
			event.favorite_event(current_user)
		end
	end
end
