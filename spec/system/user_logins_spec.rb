
require 'rails_helper'

RSpec.describe "Users", type: :system do
  let!(:user) { FactoryBot.create(:user, name: 'capybara', email: 'capybara@mail.com', password: 'password')}

  before do
    driven_by :rack_test
  end

  describe 'users/sessions' do

    it '有効なログインの場合、ルート画面に遷移すること' do
      visit new_user_session_path
      fill_in 'user[email]', with: 'capybara@mail.com'
      fill_in 'user[password]', with: 'password'
      click_button 'ログイン'
      visit root_path
    end

    context '無効なログイン' do
      it 'メールアドレスが空欄だった場合、ログイン画面のままでいること' do
        visit new_user_session_path
        fill_in 'user[email]', with: 'capybara@mail.com'
        fill_in 'user[password]', with: ''
        click_button 'ログイン'
        visit new_user_session_path
      end

      it 'パスワードが空欄だった場合、ログイン画面のままでいること' do
        visit new_user_session_path
        fill_in 'user[email]', with: ''
        fill_in 'user[password]', with: 'password'
        click_button 'ログイン'
        visit new_user_session_path
      end
    end
  end
  
  
  describe 'users/edit' do
    it ''
  end
end