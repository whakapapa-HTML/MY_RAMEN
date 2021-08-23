
require 'rails_helper'

describe Admin do

  it 'メールとパスワードの設定時には有効となる' do
    admin = Admin.new(
      email: 'admin@mail.com',
      password: 'password'
      )
      expect(admin).to be_valid
    end


  it 'メールアドレス未入力の場合は無効となる' do
    admin = Admin.new(email: nil)
    admin.valid?
    expect(admin.errors[:email]).to include ('が入力されていません。')
  end


  it 'パスワードが入力されていない場合は無効となる' do
    admin = Admin.new(password: nil)
    admin.valid?
    expect(admin.errors[:password]).to include("が入力されていません。")
  end


end