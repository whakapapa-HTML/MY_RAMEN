class Admin::UsersController < ApplicationController

  before_action :authenticate_admin!

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update!(user_params)
      redirect_to admin_users_path
    else
      render "edit"
    end
  end

  def withdrawl
    @user = User.find(params[:id])
    if @user.update(is_deleted: true)
      reset_session     #データをリセットする
      flash[:notice] = "ユーザーを退会させました"
      redirect_to admin_users_path
    else
      render :show
    end
  end

  private

    def user_params
      params.require(:user).permit(:is_deleted)
    end

end
