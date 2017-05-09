class Comment < ApplicationRecord
	has_many :actions, as: :activity
end
