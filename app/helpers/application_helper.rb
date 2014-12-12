module ApplicationHelper

	def full_title(page_title)
		base_title = "Recipez"

		if page_title.empty?
			base_title
		else 
			"#{page_title} | #{base_title}"
		end
	end

	def default_avatar
		asset_path("no_avatar.png")
	end

	def avatar_icon(user_email = '', size = nil)
		user = User.find_by(email: user_email)
		user.avatar_url(size)
	end

	def current_controller?(*args)
		args.any? { |v| v.to_s.downcase == controller.controller_name }
	end

	def current_action?(*args)
    	args.any? { |v| v.to_s.downcase == action_name }
 	end
end
