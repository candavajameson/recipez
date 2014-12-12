class UsersController < ApplicationController

	def show
		@user = User.find_by_email!(params[:email])

		@user.methods
	end
end