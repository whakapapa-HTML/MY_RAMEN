class Admin::UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def withdrawl
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "ユーザーを退会させました"
      redirect_to admin_users_path
    else
      render :show
    end
  end

  private

    def user_params
      params.permit(:is_deleted)
    end

end
