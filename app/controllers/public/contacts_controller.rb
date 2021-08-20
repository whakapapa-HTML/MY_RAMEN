class Public::ContactsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_contact, only: %i[confirm create]

  def new
    @contact = Contact.new
  end

  def confirm; end

  def create
    @contact.user_id = current_user.id
    if @contact.save
      redirect_to thanks_contacts_path
    else
      @contacts = Contact.all
      @users = User.all
      render :new
    end
  end

  def thanks; end

  private

  def contact_params
    params.require(:contact).permit(:title, :body, :reply, :user_id)
  end

  def set_contact
    @contact = Contact.new(contact_params)
  end
end
