class Api::CommentsController < ApplicationController

	def create
		event = Event.find_or_create_by(event_id: params[:event_id])
		event.add_comment(comment_params)

		render json: {comments: event.comments}

	end

	def destroy
		comment_action = Action.find_by(activity_id: params[:id])
		comment_action.delete
		comment = Comment.destroy(params[:id])
		event = Event.find_by(event_id: params[:event_id])

		render json: {comments: event.comments}
	end


  private
      def comment_params
        params.require(:comment)
          .permit(:title, :content)
          .merge(user_id: current_user.id, event_id: params[:event_id])
      end
end
