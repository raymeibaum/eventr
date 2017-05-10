class Api::AuthController < ApplicationController
	def get_user
		render json: {current_user: current_user}
	end
end
