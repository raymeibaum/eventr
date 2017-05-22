class Event < ApplicationRecord
	has_many :actions
	has_many :users, through: :actions

	def self.get_events(location, category = "all", date = "today")
		events = HTTParty.get("http://api.eventful.com/json/events/search?app_key=vg3wPtKcvHhssZxh&location=#{location}&category=#{category}&mature=safe&date=#{date}&within=5&page_size=30&change_multi_day_start=false")
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
	 	parsed.each do |category|
			category["name"] = Nokogiri::HTML(category["name"]).text
		end
		parsed
	end

	def self.get_event(id)
		event = HTTParty.get("http://api.eventful.com/json/events/get?app_key=vg3wPtKcvHhssZxh&image_sizes=large&id=#{id}")
		parsed = JSON.parse(event)
		parsed["description"] = Nokogiri::HTML(parsed["description"]).text
		if parsed
			return parsed
		else
			return nil
		end
	end

	def comments
		comments = []
		actions.where(activity_type: "Comment").each do |action|
			comments << {activity: action.activity, user: action.user}
		end
		comments
	end

	def favorites
		favorites = []
		actions.where(activity_type: "Favorite").each do |action|
			favorites << {activity: action.activity, user: action.user}
		end
		favorites
	end

	def favorite(user)
		actions.find_by(activity_type: "Favorite", user_id: user.id)
	end

	def add_comment(params)
		comment = Comment.create(title: params[:title], content: params[:content])

		action = Action.create(
			user_id: params[:user_id],
			event_id: self.id,
			activity_id: comment.id,
			activity_type: "Comment"
			)
	end

	def remove_comment(user, comment_id)
		action = Action.find_by(
			event_id: self.id,
			user_id: user.id,
			comment_id: comment_id,
			activity_type: "Comment"
			)

		comment = action.activity
		comment.delete
		action.delete
	end
end
