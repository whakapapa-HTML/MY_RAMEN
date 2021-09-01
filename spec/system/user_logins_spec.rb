
require 'rails_helper'

RSpec.describe "Users", type: :system do
  let!(:user) { FactoryBot.create(:user, name: 'capybara', email: 'capybara@mail.com', password: 'password')}

  before do
    driven_by :rack_test
  end

  shared_context "ログインしている" do
    before do
      visit new_user_session_path
      fill_in 'user[email]', with: 'capybara@mail.com'
      fill_in 'user[password]', with: 'password'
      click_button 'ログイン'
      visit root_path
    end
  end

  shared_context "編集ページへ遷移する" do
    before do
      visit my_page_path
      click_on "編集する"
    end
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
    include_context "ログインしている"
    it 'マイページ遷移後に、変更する、' do
      fill_in 'user[name]', with: 'test1'
      fill_in 'user[introduction]', with: 'test1'
      click_button '変更する'
      visit my_page_path
    end
    
    include_context "編集ページへ遷移する"
    it '有効なユーザー編集の場合、マイページへリダイレクトすること' do
      fill_in 'user[name]', with: 'test1'
      fill_in 'user[introduction]', with: 'test1'
      click_button '変更する'
      visit my_page_path
    end

    it '名前が空欄だった場合、エラーメッセージが出力されること' do
      fill_in 'user[name]', with: ''
      fill_in 'user[introduction]', with: 'test1'
      click_button '変更する'
      has_text?("が入力されていません。")
      expect(page).to have_css '.error_explanation'
    end

     it '自己紹介が空欄だった場合は、編集ページにリダイレクトすること' do
      fill_in 'user[name]', with: 'test'
      fill_in 'user[introduction]', with: ''
      click_button '変更する'
       visit my_page_path
    end
  end
end