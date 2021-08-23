
# require 'rails_helper'

# describe Public::UsersController, type: :controller do
  
#   before do
#     @user = build(:user)
#   end
#   context 'ログイン後' do
#     before do
#       login(@user)
#     end

#     it 'トップ画面にいく' do
#       get :index
#       expect(response).to have_http_status "200"
#     end
#   end

#   context '未ログインの場合' do
#     it 'トップに行くと302(エラー)が返される' do
#       get :index
#       expect(response).to have_http_status "302"
#     end
#     it 'トップに行くとuserログインページにリダイレクトされる' do
#       get :index
#       expect(response).to redirect_to new_user_session_path
#     end
#   end
# end

