
require 'rails_helper'

  describe Public::ReviewsController, type: :request do
    let(:user) { create(:user) }
    let(:review) { create(:review) }
    before do
      sign_in user
    end

    describe 'POST #create' do
      it 'レビュー投稿に成功すると、レシピ詳細へリダイレクトする' do
        post recipe_reviews_path(review), params: { review: attributes_for(:review) }
        expect(response).to redirect_to recipe_path(id: review.recipe_id)
      end

      context "レビュー投稿失敗時のリダイレクト" do
        it 'レビュータイトルが空欄だった場合' do
          post recipe_reviews_path(review), params: { review: attributes_for(:review), title: ""}
          expect(response).to redirect_to recipe_path(id: review.recipe_id)
        end
        it 'レビューボディが空欄だった場合' do
          post recipe_reviews_path(review), params: { review: attributes_for(:review), body: ""}
          expect(response).to redirect_to recipe_path(id: review.recipe_id)
        end
        it 'レビュー星評価が空欄だった場合' do
          post recipe_reviews_path(review), params: { review: attributes_for(:review), evaluation: ""}
          expect(response).to redirect_to recipe_path(id: review.recipe_id)
        end
      end
    end
  end
