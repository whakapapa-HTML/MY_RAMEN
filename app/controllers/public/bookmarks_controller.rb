class Public::BookmarksController < ApplicationController
  before_action :authenticate_user!

  def create
    @recipe = Recipe.find(params[:recipe_id])
    bookmark = @recipe.bookmarks.new(user_id: current_user.id)
    bookmark.save
  end

  def destroy
    @recipe = Recipe.find(params[:recipe_id])
    bookmark = @recipe.bookmarks.find_by(user_id: current_user.id)
    bookmark.present?
    bookmark.destroy
  end
end
