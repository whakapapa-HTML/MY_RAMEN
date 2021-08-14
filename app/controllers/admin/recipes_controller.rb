class Admin::RecipesController < ApplicationController

  def index
    @recipes = Recipe.all
  end

  def show
    @recipe = Recipe.find(params[:id])
    @reviews = @recipe.reviews.all
    @rate_avg = @reviews.average(:evaluation).to_i
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    redirect_to admin_root_path
  end
end
