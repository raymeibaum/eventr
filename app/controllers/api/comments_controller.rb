class Api::CommentsController < ApplicationController
  def index
    @comments = Comment.all

    render json: @comments
  end


  private
      def post_params
        params.require(:comment)
          .permit(:title, :content)
          .merge(user_id: current_user.id, event_id: params[:event_id])
      end

end
