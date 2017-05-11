class Api::EventsController < ApplicationController
	def events_with_specifics
		events = Event.get_events(params[:latlng], params[:id], params[:date])

		events ? (render json: events) :
		(render json: {status: 404, message: "No events found."})
	end

	def events_all
		events = Event.get_events(params[:latlng])

		events ? (render json: events) :
		(render json: {status: 404, message: "No events found."})
	end

	def categories
		categories = Event.get_categories
		render json: categories
	end

	def show
		event = Event.find_or_create_by(event_id: params[:id])
		is_favorite = current_user.has_favorite_for(event)
		eventful = Event.get_event(params[:id])
		comments = event.comments

		render json: {event: event, eventful: eventful, comments: comments, favorite: is_favorite}
	end
end
