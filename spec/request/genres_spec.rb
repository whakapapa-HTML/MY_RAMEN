
require 'rails_helper'

  describe Admin::GenresController, type: :request do
    before do
      sign_in admin
    end
    let(:admin) { create(:admin) }
    let(:genre) { create(:genre) }

    describe 'GET #show' do
      before { get admin_genres_path, params: { genre: { id: genre.id } }}
      it 'リクエストされたインスタンス変数をテスト' do
        expect(assigns(:genre)).to eq @genre  #assignsの引数がインスタンス変数になる @genre
      end

      it 'ジャンル詳細へ遷移できること' do
        expect(response).to render_template '/admin/genres/show'
      end
    end

    describe 'GET /admin/genres/new' do

      describe 'POST #create' do
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
    end
  end
