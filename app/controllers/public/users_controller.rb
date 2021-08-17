class Public::UsersController < ApplicationController
  before_action :authenticate_user!
  
  def show
    @user = current_user
    @bookmarks = Bookmark.where(user_id: current_user.id)
    @followings = @user.followings
    @followers = @user.followers
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to my_page_path(@user)
    else
      render :edit
    end
  end

  def cancel
    @user = current_user
  end

  def unsubscribe
    @user = current_user
    @user.update(is_deleted: true)
    redirect_to root_path
  end

  private

    def user_params
      params.require(:user).permit(:name, :introduction)
    end
end
