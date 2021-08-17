class Public::RelationshipsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_recipe, only: [:create, :destroy]


  def create
    current_user.follow(params[:user_id])
  end

  def destroy
    current_user.unfollow(params[:user_id])
  end

  def followings

  end

  def followers
     user = User.find(params[:user_id])
     @users = user.followers
  end


  private

    def set_recipe
      @recipe = Recipe.find(params[:recipe_id])
    end

end
