class Api::CommentsController < ApplicationController

	def create
		comment = Comment.create(title: params[:title], content: params[:content])
		@event = Event.find_or_create_by(event_id: params[:event_id])
		comment_action = Action.create(user_id: current_user.id, event_id: @event.id, activity_id: comment.id, activity_type: "Comment")

		render json: {comments: @event.comments}

	end

	def destroy
		comment = Comment.find(params[:event_id])
		comment.destroy

		render json: {status: 200, message: "Comment deleted."}
	end


  private
      def post_params
        params.require(:comment)
          .permit(:title, :content)
          .merge(user_id: current_user.id, event_id: params[:event_id])
      end

end
