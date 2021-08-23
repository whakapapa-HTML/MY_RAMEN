class Admin::RecipesController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_recipe, except: %i[index genre_chart week_chart]

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

  def genre_chart
    @genres = Genre.all
    @recipes = Genre.joins(:recipes).group(:name)
  end

  def week_chart
    @recipes = Recipe.all
    @recipes_today = @recipes.created_today   # 前日比
    @recipes_yesterday = @recipes.created_yesterday

    @recipes_this_week = @recipes.created_this_week # 先週比
    @recipes_last_week = @recipes.created_last_week

    @recipes_this_month = @recipes.created_this_month  # 先月比
    @recipes_last_month = @recipes.created_last_month
  end

  private

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end
end
