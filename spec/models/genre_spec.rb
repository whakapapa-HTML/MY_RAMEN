
require 'rails_helper'


describe Genre do
  let(:genre) { build(:genre) }

  describe "#create" do
    it "ジャンル名と画像の登録でジャンルが作成できる" do
      expect(genre).to be_valid
    end

    it "ジャンル名が空欄の場合は無効となる" do
      genre = build(:genre, name: "")
      genre.valid?
      expect(genre.errors[:name]).to include("が入力されていません。")
    end

    it "ジャンル画像が空欄の場合は無効となる" do
      genre = build(:genre, genre_image: "")
      genre.valid?
      expect(genre.errors[:genre_image]).to include("が入力されていません。")
    end
  end
end
