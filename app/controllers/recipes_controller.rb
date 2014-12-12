class RecipesController < ApplicationController
	
	before_action :authenticate_user!
	before_action :correct_user, only: [:edit, :update]
	before_filter :set_recipe, only: [:edit, :update]
	
	def index
		@recipes = current_user.recipes.page(params[:page]).per(10)
	end

	def new
		@recipe = Recipe.new
	end

	def create
		@recipe = current_user.recipes.build(recipe_params)
		
		if @recipe.save
			flash["success"] = "Successfully added recipe"
			redirect_to 'index'
		else
			render 'new'
		end
	end

	def edit
	end

	def update
		if @recipe.update_attributes(recipe_params)
			flash[:success] = "Successfully updated recipe"
			redirect_to recipes_path
		else
			render 'edit'
		end
	end

	private

	def set_recipe
		@recipe = Recipe.find(params[:id])
	end

	def correct_user
		@recipe = current_user.recipes.find_by(id: params[:id])
		redirect_to root_url if @recipe.nil?
	end

	def recipe_params
		params.require(:recipe).permit(
			:title, :desc, :ingredients, :procedures, 
			:user_id, :category_id, :avatar, :meal_type
		)
	end
end
