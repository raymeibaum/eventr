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

	def add_comment(title, content, user)
		event_user = EventUser.find_or_create_by(user_id: user.id, event_id: self.id, is_favorite?: false)
		Comment.create(eventUser_id: event_user.id, title: title, content: content)
	end

	def favorite_event(user)
		EventUser.find_or_create_by(user_id: user.id, event_id: self.id, is_favorite?: true)
	end

	def unfavorite_event(user)
		event = EventUser.find_by(user_id: user.id, event_id: self.id)
		event.is_favorite? = false;
		event.save
	end

end
