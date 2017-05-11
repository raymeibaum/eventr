class Api::UsersController < ApplicationController
  def show
    user = User.find_by(id: params[:id])
    comments = user.comments

	render json: {user: user, comments: comments} 
  end
end
