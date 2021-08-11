class Public::UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @bookmarks = Bookmark.where(user_id: current_user.id)
    @users = @user.followings
  end

  def edit
  end

  def update
  end

  def cancel
  end

  def unsubscribe
  end
end
