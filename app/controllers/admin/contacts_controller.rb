class Admin::ContactsController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_contact, only: %i[update status destroy]

  def index
    @contacts = Contact.page(params[:page]).order(created_at: :desc).per(16)
    @users = User.all
  end

  def edit
    @contact = Contact.find(params[:id])
  end

  def update
    @contact.update(contact_params)
    user = @contact.user
    ContactMailer.send_when_admin_reply(user, @contact).deliver_now  # 確認メールを送信
    redirect_to admin_contacts_path, notice: '送信に成功しました！'
  end

  def status
    @contact.update!(status_params)
    redirect_to request.referer
  end

  def destroy
    @contact.destroy
    @contacts = Contact.page(params[:page])
    @users = User.all
    render :index
  end

  private

  def contact_params
    params.require(:contact).permit(:title, :body, :reply, :user_id)
  end

  def status_params
    params.require(:contact).permit(:status)
  end

  def set_contact
    @contact = Contact.find(params[:id])
  end
end
