class DashboardController < ApplicationController
  
  def index
  	@recipes = Recipe.all.order(:created_at => :desc)
  end

  def show
	@recipe = Recipe.find(params[:id])
  end

end
