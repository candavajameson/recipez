class Profiles::AccountController < ApplicationController

	layout 'profile'
	
	def show
		@user = current_user
	end
end