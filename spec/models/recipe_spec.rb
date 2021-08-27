
require 'rails_helper'


describe Recipe do

  describe '#create' do
    let(:recipe) { build(:recipe) }

    context 'レシピ概要欄(材料、調理手順)のバリデーション' do
      it "レシピ投稿欄が全て満たされている場合、有効となる" do
        expect(recipe).to be_valid
      end

      it "レシピ名が入力されていない場合、無効となる" do
        recipe = build(:recipe, name: "")
        recipe.valid?
        expect(recipe.errors[:name]).to include("が入力されていません。")
      end

      it "レシピ紹介が入力されていない場合、無効となる" do
        recipe = build(:recipe, introduction: "")
        recipe.valid?
        expect(recipe.errors[:introduction]).to include("が入力されていません。")
      end

      it "完成人数が入力されていない場合、無効となる" do
        recipe = build(:recipe, serving: "")
        recipe.valid?
        expect(recipe.errors[:serving]).to include("が入力されていません。")
      end

      it "レシピ画像が入力されていない場合、無効となる" do
        recipe = build(:recipe, recipe_image: "")
        recipe.valid?
        expect(recipe.errors[:recipe_image]).to include("が入力されていません。")
      end
    end

    # context 'レシピの材料欄のバリデーション' do
    #   it "材料名が空欄の場合、無効となる" do
    #     recipe = build(:recipe)
        
    #     expect(recipe.errors[:ingrdient]).to include("が入力されていません。")
    #   end
    # end
  end
end
