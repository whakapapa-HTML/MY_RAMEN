
require 'rails_helper'

describe Review do
  let(:review) { create(:review) }
  it 'タイトルと本文と星評価でレビュー成功' do
      @review = build(:review)
      @review.valid?
      expect(@review).to be_valid
  end
end
