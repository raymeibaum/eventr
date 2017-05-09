class Api::UsersController < ApplicationController
  def show
    @user = User.find_by(id: params[:id])

		@user ? (render json: @user.to_json(include: [:eventUsers, :events])) :
		(render json: {status: 404, message: "User not found."})
  end
end



# @user.favorites
