class Api::UsersController < ApplicationController
  def show
    @user = User.find_by(id: params[:id])
    @event = Event.find_or_create_by(event_id: params[:id])
    # @eventful = Event.get_event(params[:id])
    @comments = @event.comments

    # @event ? (render json: {event: @event, user: @user, comments: @comments}) :(render json: {status: 404, message: "Event not found."})

		@user ? (render json: @user.to_json(include: [:events, :comments])) :
		(render json: {status: 404, message: "User not found."})
  end
end
