class Public::BookmarksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_recipe

  def create
    bookmark = @recipe.bookmarks.new(user_id: current_user.id)
    bookmark.save
  end

  def destroy
    bookmark = @recipe.bookmarks.find_by(user_id: current_user.id)
    bookmark.present?
    bookmark.destroy
  end

  private

  def set_recipe
    @recipe = Recipe.find(params[:recipe_id])
  end
end
