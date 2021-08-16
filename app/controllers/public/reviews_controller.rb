class Public::ReviewsController < ApplicationController

  def index
    @recipe = Recipe.find(params[:recipe_id])
    @reviews = @recipe.reviews.all
    @rate_avg = @reviews.average(:evaluation).to_f
  end

  def create
    @recipe = Recipe.find(params[:recipe_id])
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

end
