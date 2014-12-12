class Review < ActiveRecord::Base
	
	belongs_to :recipe
	belongs_to :user

	
	#Scopes
	scope :by_user, ->(user) { where(:user_id => user.id)}
end
