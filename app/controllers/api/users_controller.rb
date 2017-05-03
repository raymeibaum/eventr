class Api::UsersController < ApplicationController
  def show
    # @user = User.find_by(id: params[:id])
    @user = current_user

		@user ? (render json: @user) :
		(render json: {status: 404, message: "User not found."})
  end
end
