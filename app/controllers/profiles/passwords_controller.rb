class Profiles::PasswordsController < ApplicationController
	
	before_filter :set_user
	layout 'profile'
	
	def edit
	end

	def update
		password_attributes = user_params.select do  |key, value|
				%w(password password_confirmation).include?(key.to_s)
		end

		unless @user.valid_password?(user_params[:current_password])
			redirect_to edit_profile_password_path, alert: 'You must provide a valid current password'
			return
		end

		if @user.update_attributes(password_attributes)
			flash[:notice] = "Password was successfully updated."
			redirect_to new_user_session_path
		else
			render 'edit'
		end
	end

	private
		def set_user
			@user = current_user
		end

		def user_params
			params.require(:user).permit(
				:current_password, :password, :password_confirmation
			)
		end
end