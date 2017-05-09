class Action < ApplicationRecord
  belongs_to :activity, polymorphic: true
  belongs_to :event
  belongs_to :user
end
