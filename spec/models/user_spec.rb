require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context 'ユーザー新規登録がうまくいくとき' do
      it 'すべての項目が存在すれば保存できる' do
        expect(@user).to be_valid
      end
    end

    context 'ユーザー新規登録がうまくいかないとき' do
      it 'nicknameが空だと登録できない' do
        @user.nickname = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空だと登録できない' do
        @user.email = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'emailが重複すると登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it 'profileが空だと登録できない' do
        @user.profile = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Profile can't be blank")
      end
      it 'passwordが空だと登録できない' do
        @user.password = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが存在してもpassword_confirmationが空だと登録できない' do
        @user.password = "aaaaaa"
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'passwordとpassword_confirmationが一致しなければ登録できない' do
        @user.password = "aaaaaa"
        @user.password_confirmation = "bbbbbb"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'passwordが6文字以下だと登録できない' do
        @user.password = "aaaaa"
        @user.password_confirmation = "aaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it 'passwordが数字のみだと登録できない' do
        @user.password = 111111
        @user.password_confirmation = 111111
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid. Input half-width characters")
      end
    end
  end
end
