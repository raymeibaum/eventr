class Favorite < ApplicationRecord
  has_many :actions, as: :activity
end
