class Event < ApplicationRecord
	has_many :favorites
	has_many :users, through: :favorites

	has_many :comments
	has_many :users, through: :comments

	def self.get_events(location = "Decatur, GA 30032", date = "today")
		events = HTTParty.get("http://api.eventful.com/json/events/search?app_key=vg3wPtKcvHhssZxh&location=#{location}&date=#{date}&within=5&page_size=30")
		parsed = JSON.parse(events)
	end

	def self.get_categories()
		categories = HTTParty.get("http://api.eventful.com/json/categories/list?app_key=vg3wPtKcvHhssZxh")
		parsed = JSON.parse(categories)["category"]
	end
end
