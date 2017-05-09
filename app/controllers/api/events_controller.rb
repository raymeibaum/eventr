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
		@event = Event.get_event(params[:id])

		@event ? (render json: @event) :(render json: {status: 404, message: "Event not found."})

	end

	def comments
		@event = Event.load_event(params[:id])
		@comments = @event.comments
	end

	def favorite_or_comment
		binding.pry
		event = Event.find_or_create_by(event_id: params[:id])
		if params[:comment]
			event.add_comment(params[:title], param[:content], current_user)
		else
			event.favorite_event(current_user)
		end
	end
end
