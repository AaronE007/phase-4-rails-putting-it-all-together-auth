class RecipesController < ApplicationController
  
  def index
    render json: Recipe.all
  end

  def create
    recipe = Recipe.create!(recipe_params.merge(user_id: @current_user.id))
    render json: recipe, status: :created
  end

  private

  def recipe_params
    params.permit(:title, :instructions, :minutes_to_complete)
  end

end
