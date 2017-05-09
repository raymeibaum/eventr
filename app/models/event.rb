class Event < ApplicationRecord

	has_many :eventUsers
	has_many :users, through: :eventUsers

	def self.get_events(location, category = "all")
		events = HTTParty.get("http://api.eventful.com/json/events/search?app_key=vg3wPtKcvHhssZxh&location=#{location}&category=#{category}&mature=safe&date=today&within=5&page_size=30&change_multi_day_start=false")
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

	def self.get_event(id)
		event = HTTParty.get("http://api.eventful.com/json/events/get?app_key=vg3wPtKcvHhssZxh&id=#{id}")
		parsed = JSON.parse(event)
		if parsed
			return parsed
		else
			return nil
		end
	end

	# def save_as_favorite_for(user)
	# 	Favorite.find_or_create_by(event_id: self.id, user_id: user.id)
	# end
	#
	# def save_as_comment_for(user)
	# 	Comment.find_or_create_by(event_id: self.id, user_id: user.id)
	# end

end
