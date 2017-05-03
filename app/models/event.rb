class Event < ApplicationRecord
	has_many :favorites
	has_many :users, through: :favorites

	has_many :comments
	has_many :users, through: :comments

	def self.get_events(location = "Atlanta", date = "today")
		events = HTTParty.get("http://api.eventful.com/json/events/search?app_key=vg3wPtKcvHhssZxh&location=#{location}&date=#{date}")
		parsed = JSON.parse(events)["events"]["event"]
	end
end
