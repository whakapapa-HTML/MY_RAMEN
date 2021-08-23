class Public::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user

  def show
    @bookmarks = Bookmark.where(user_id: current_user.id)
    @followings = @user.followings
    @followers = @user.followers
  end

  def edit; end

  def update
    if @user.update(user_params)
      redirect_to my_page_path(@user)
    else
      render :edit
    end
  end

  def cancel; end

  def unsubscribe
    @user.update(is_deleted: true)
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction)
  end

  def set_user
    @user = current_user
  end
end
