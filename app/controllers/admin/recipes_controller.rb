class Admin::RecipesController < ApplicationController
  before_action :authenticate_admin!
  before_acttion :set_recipe, except: [:index]

  def index
    @recipes = Recipe.all
  end

  def show
    @reviews = @recipe.reviews.all
    @rate_avg = @reviews.average(:evaluation).to_i
  end

  def destroy
    @recipe.destroy
    redirect_to admin_root_path
  end

  private

    def set_recipe
      @recipe = Recipe.find(params[:id])
    end

end
