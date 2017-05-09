class Api::CommentsController < ApplicationController

	def create
		event = Event.find_or_create_by(event_id: params[:event_id])
		event.save_as_comment_for(current_user)

		render json: {status: 201, message: "Comment created."}
	end

	def destroy
		comment = Comment.find(params[:event_id])
		comment.destroy

		render json: {status: 200, message: "Comment deleted."}
	end
end


  private
      def post_params
        params.require(:comment)
          .permit(:title, :content)
          .merge(user_id: current_user.id, event_id: params[:event_id])
      end

end
