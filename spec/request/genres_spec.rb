
require 'rails_helper'

  describe Admin::GenresController, type: :request do
    before do
      sign_in admin
    end
    let(:admin) { create(:admin) }
    let(:genre) { create(:genre) }

    describe 'GET #show' do
        before { get admin_genre_path(genre), params: { genre: { id: genre.id } }}
      it 'リクエストされたインスタンス変数のテスト' do
        expect(assigns(:genre)).to eq genre  #assignsの引数がインスタンス変数になる -> @genre
      end

      it 'インスタンス変数で詳細画面をレンダーする' do
        expect(response).to render_template :show
      end
    end

    describe 'GET #create' do
      it 'ジャンル登録に成功するとジャンル一覧へ遷移する' do
        post admin_genres_path, params: { genre: {name: genre.name, genre_image: Rack::Test::UploadedFile.new(File.join(File.join(Rails.root, '/spec/fixtures/images/test.jpg'))) }}
        expect(response).to redirect_to admin_genres_path
      end

      context 'ジャンル投稿のバリデーション' do
        example 'ジャンル名がなかった場合' do
          post admin_genres_path, params: { genre: {name: "", genre_image: Rack::Test::UploadedFile.new(File.join(File.join(Rails.root, '/spec/fixtures/images/test.jpg'))) }}
          expect(response).not_to redirect_to admin_genres_path
        end

        example 'ジャンル画像がなかった場合' do
          post admin_genres_path, params: { genre: {name: "つけ麺", genre_image: "" }}
          expect(response).not_to redirect_to admin_genres_path
        end
      end
    end

    describe 'PATCH #update' do
      it 'リクエストされたインスタンス変数のテスト' do
        patch admin_genre_path(genre), params: { genre: attributes_for(:genre) }
        expect(assigns(:genre)).to eq genre
      end

      it 'インスタンス変数の属性をアップデート' do
        patch admin_genre_path(genre), params: { genre: attributes_for(:genre, name: 'hoge', genre_image: 'hogehoge')}
        genre.reload
        expect(genre.name).to eq("hoge")
        expect(genre.genre_image).to eq("hogehoge")
      end

      # it "投稿成功後、一覧画面へ遷移する" do
      #   patch admin_genre_path(genre), params: { genre: attributes_for(:genre) }
      #   expect(response).to redirect_to admin_genres_path
      # end

    end
  end
