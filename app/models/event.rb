class Event < ApplicationRecord
	has_many :favorites
	has_many :users, through: :favorites

	has_many :comments
	has_many :users, through: :comments

	def self.get_events_for_category(location = "Atlanta", category = "all")
		events = HTTParty.get("http://api.eventful.com/json/events/search?app_key=vg3wPtKcvHhssZxh&location=#{location}&category=#{category}&date=today&within=5&page_size=30")
		parsed = JSON.parse(events)["events"]
		if parsed
			return parsed["event"]
		else
			return nil
		end
	end

	def self.get_events_for_all(location = "Atlanta")
		events = HTTParty.get("http://api.eventful.com/json/events/search?app_key=vg3wPtKcvHhssZxh&location=#{location}&date=today&within=5&page_size=30")
		parsed = JSON.parse(events)["events"]
		if parsed
			return parsed["event"]
		else
			return nil
		end
	end

	def self.get_categories()
		categories = HTTParty.get("http://api.eventful.com/json/categories/list?app_key=vg3wPtKcvHhssZxh")
		parsed = JSON.parse(categories)["category"]
	end

	def self.load_event(id)
		event = HTTParty.get("http://api.eventful.com/json/events/get?app_key=vg3wPtKcvHhssZxh&id=#{id}")
		parsed = JSON.parse(event)
		if parsed
			return parsed
		else
			return nil
		end
	end

end
