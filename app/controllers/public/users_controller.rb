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
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  def cancel
    @user = User.find(params[:id])
  end

  def unsubscribe
    @user = User.find(params[:id])
    @user.update(is_deleted: true)
    redirect_to root_path
  end

  private

    def user_params
      params.require(:user).permit(:name, :introduction)
    end
end
