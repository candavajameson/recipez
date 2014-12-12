class Admin::CategoriesController < ApplicationController
	
	def index
		@categories = Category.page(params[:page]).per(10)
	end

	def show
		@category = Category.find(params[:id])
	end

	def edit
		@category = Category.find(params[:id])
	end

	def update
		@category = Category.find(params[:id])
		if @category.update_attributes(category_params)
			flash[:success] = 'Successfully updated category'
			redirect_to admin_category_path
		else
			render 'edit'
		end
	end

	def new
		@category = Category.new
	end

	def create
		@category = Category.new(category_params)

		if @category.save
			flash[:success] = 'Successfully created category'
			redirect_to admin_category_path
		else
			flash[:error] = 'Category was not save'
			render 'new'
		end
	end

	private
	def category_params
		params.require(:category).params(
			:name)
	end
end