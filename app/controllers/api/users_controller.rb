class Api::UsersController < ApplicationController
  def show
    user = User.find_by(id: params[:id])
    favorites = user.favorites
    comments = user.comments

		render json: {user: user, comments: comments, favorites: favorites}
  end
end
