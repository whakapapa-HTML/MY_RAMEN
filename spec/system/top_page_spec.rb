
require 'rails_helper'

RSpec.describe "applicaion/layouts/header", type: :system do
  let!(:user) { create(:user, name: 'capybara', email: 'capybara@mail.com', password: 'password')}

  describe 'ユーザー利用時' do
    shared_context "ユーザーログイン状態" do
      before do
        visit new_user_session_path
        fill_in 'user[email]', with: 'capybara@mail.com'
        fill_in 'user[password]', with: 'password'
        click_button 'ログイン'
      end
    end

    context 'ログイン前のヘッダー' do
      it 'ログイン、新規登録リンク、検索フィールドがあること' do
        visit root_path
        expect(page).to have_link 'ログイン'
        expect(page).to have_link '新規登録'
        expect(page).to have_field 'レシピを検索する'
      end
    end

    context 'ログイン後のヘッダー' do
      include_context "ユーザーログイン状態"

      it 'フラッシュメッセージが出ること' do
        expect(page).to have_content 'ログインしました。'
      end

      it 'ログアウト、マイページ、レシピ投稿リンク、検索フィールドがあること' do
        expect(page).to have_link 'ログアウト'
        expect(page).to have_link 'マイページ'
        expect(page).to have_link 'レシピを投稿する'
        expect(page).to have_field 'レシピを検索する'
      end
    end
  end

  describe '管理者利用時' do
    let!(:admin) { create(:admin) }
    shared_context "管理者ログイン状態" do
      before do
        visit new_admin_session_path
        fill_in 'admin[email]', with: admin.email
        fill_in 'admin[password]', with: admin.password
        click_button 'ログイン'
      end
    end
    context 'ログイン前のヘッダー' do
      it 'ログイン、新規登録リンク、検索フィールドがあること' do
        visit root_path
        expect(page).to have_link 'ログイン'
        expect(page).to have_link '新規登録'
        expect(page).to have_field 'レシピを検索する'
      end
    end

    context 'ログイン後のヘッダー' do
      include_context '管理者ログイン状態'
      
      it 'フラッシュメッセージが出ること' do
        expect(page).to have_content 'ログインしました。'
      end
      
      it 'ログアウト、お問い合わせ一覧、会員一覧、レシピ一覧、ジャンル一覧' do
        expect(page).to have_link 'ログアウト'
        expect(page).to have_link 'お問い合わせ一覧'
        expect(page).to have_link '会員一覧'
        expect(page).to have_link 'レシピ一覧'
        expect(page).to have_link 'ジャンル一覧'
      end
    end
  end

end