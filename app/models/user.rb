class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

	has_many :actions
	has_many :events, through: :actions

	def comments
		comments = []
		actions.where(activity_type: "Comment").each do |action|
			comments << action.activity 
		end
		comments
	end

	def favorites
		favorites = []
		actions.where(activity_type: "Favorite").each do |action|
			favorites << action.activity
		end
		favorites
	end
end
