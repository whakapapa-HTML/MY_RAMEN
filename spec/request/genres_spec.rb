
require 'rails_helper'

  describe Admin::GenresController, type: :request do
    let(:admin) { create(:admin) }
    let(:genre) { create(:genre) }
    describe 'GET /admin/genres/new' do
      before do
        sign_in admin
      end

      it 'ジャンル登録に成功するとジャンル一覧へ遷移する' do
        post admin_genres_path, params: { genre: {name: genre.name, genre_image: Rack::Test::UploadedFile.new(File.join(File.join(Rails.root, '/spec/fixtures/images/test.jpg')))  }}
        expect(response).to redirect_to admin_genres_path
      end
    end
  end
