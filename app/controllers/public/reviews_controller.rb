class Public::ReviewsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_recipe, only: [:index, :create]

  def index
    @reviews = @recipe.reviews.all
    @rate_avg = @reviews.average(:evaluation).to_f
  end

  def create
    @review = current_user.reviews.new(review_params)
    @review.recipe_id = @recipe.id

    if @review.save
      redirect_to recipe_path(@recipe)
    else
      redirect_to recipe_path(@recipe), alert: "レビューに失敗しました"
    end
  end

  def destroy
    Review.find_by(id: params[:id], recipe_id: params[:recipe_id]).destroy
    redirect_to recipe_path(params[:recipe_id])
  end


  private

    def review_params
      params.require(:review).permit(:title, :body, :evaluation)
    end

    def set_recipe
      @recipe = Recipe.find(params[:recipe_id])
    end

end
