class Public::RelationshipsController < ApplicationController
  before_action :authenticate_user!

  def create
    @recipe = Recipe.find(params[:recipe_id])
    current_user.follow(params[:user_id])
  end

  def destroy
    @recipe = Recipe.find(params[:recipe_id])
    current_user.unfollow(params[:user_id])
  end

  def followings

  end

  def followers
     user = User.find(params[:user_id])
     @users = user.followers
  end

end
