class ReviewsController < ApplicationController

	before_action :authenticate_user!
	
	def new
	end

	def create
		@recipe = Recipe.find(params[:recipe_id])
		@review = @recipe.reviews.by_user(current_user).build(reviews_param)

		if @review.save
			flash[:success] = 'Successfully created a review'
			redirect_to dashboard_path(@recipe)
		else
			flash[:error] = 'Error'
			@recipe
		end
	end

	private 
	def reviews_param 
		params.require(:review).permit(
			:user_id, :recipe_id, :rating, :message, :title
		)
	end
end