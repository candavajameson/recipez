class User < ActiveRecord::Base
  
  mount_uploader :avatar, AvatarUploader
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
   
  ratyrate_rater
  
  has_many :recipes, dependent: :destroy
  has_many :reviews, dependent: :destroy
end
