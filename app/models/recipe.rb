class Recipe < ActiveRecord::Base

	mount_uploader :avatar, AvatarUploader
	
	belongs_to :user
	belongs_to :category
	has_many   :reviews

	ratyrate_rateable "taste"

	validates :title, presence: true
	validates :desc, presence: true
	validates :user_id, presence: true

end
