
require 'rails_helper'

describe User do
  describe '#registrations'

    it 'メールとアカウント名パスワードの設定時には有効となる' do
      user = build(:user)
      expect(user).to be_valid
      end

    it 'メールアドレスがない状態では無効となる' do
      user = build(:user, email: "")
      user.valid?
      expect(user.errors[:email]).to include("が入力されていません。")
    end

    it 'アカウント名がない場合は無効となる' do
      user = build(:user, name: "")
      user.valid?
      expect(user.errors[:name]).to include("が入力されていません。")
    end

    it 'パスワードが入力されていない場合は無効となる' do
      user = build(:user, password: "")
      user.valid?
      expect(user.errors[:password]).to include("が入力されていません。")
    end

    it 'パスワード確認が入力されていない場合は無効となる' do
      user = build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("が内容とあっていません。")
    end

    it '重複したパスワードが存在する場合、登録できないこと' do
      user1 = create(:user, email: "test@mail.com")
      user2 = build(:user, email: "test@mail.com")
      user2.valid?
      expect(user2.errors[:email]).to include("は既に使用されています。")
    end

    it 'passwordが6文字以上であれば登録できること' do
      user = build(:user, password: "123456", password_confirmation: "123456")
      expect(user).to be_valid
    end

    it 'passwordが5文字以上であれば登録できないこと' do
      user = build(:user, password: "12345", password_confirmation: "12345")
      user.valid?
      expect(user.errors[:password]).to include("は6文字以上に設定して下さい。")
    end




end