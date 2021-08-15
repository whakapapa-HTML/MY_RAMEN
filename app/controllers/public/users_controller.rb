class Public::UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @bookmarks = Bookmark.where(user_id: current_user.id)
    @followings = @user.followings
    @followers = @user.followers
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
  end

  def cancel
  end

  def unsubscribe
  end
end
