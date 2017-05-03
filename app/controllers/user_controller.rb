class UserController < ApplicationController
    before_action :authenticate_user!

    def index

    end

    def show
      @user = User.find(params[:id])

			render json: @user
    end
end
