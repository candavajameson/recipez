class ProfilesController < ApplicationController
	
	before_filter :user
	before_filter :authenticate_user!

	layout 'profile'

	def show

	end

	def update
		if @user.update_attributes(user_params)
			flash[:notice] = "Profile was successfully updated"
		else
			flash[:alert] = "Failed to update profile"
		end

		respond_to do |format|
			format.html { redirect_to :back }
			format.js
		end
	end

	private 

	def user
		@user = current_user
	end

	def user_params
		params.require(:user).permit(
			:email, :first_name, :last_name, :avatar
		)
	end
end