class Public::UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
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
