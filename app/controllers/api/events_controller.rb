class Api::EventsController < ApplicationController
	def events_for_category
		@events = Event.get_events_for_category(params[:latlng], params[:id])

		@events ? (render json: @events) :
		(render json: {status: 404, message: "No events found."})
	end

	def events_all
		@events = Event.get_events_for_all(params[:latlng])

		@events ? (render json: @events) :
		(render json: {status: 404, message: "No events found."})
	end

	def categories
		@categories = Event.get_categories

		render json: @categories
	end

	def show
		@event = Event.find_by(id: params[:id])

		@event ? (render json: @event) :
		(render json: {status: 404, message: "User not found."})
	end
end
