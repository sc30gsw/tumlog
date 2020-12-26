require 'rails_helper'

RSpec.describe Early, type: :model do
  before do
    @early = FactoryBot.build(:early)
  end

  describe '新規投稿' do
    context '新規投稿がうまくいくとき' do
      it 'textが空でも保存できる' do
        @early.text = nil
        expect(@early).to be_valid
      end
      it '画像が空でも保存できる' do
        @early.image = nil
        expect(@early).to be_valid
      end
      it 'textと画像の両方があれば保存できる' do
        expect(@early).to be_valid
      end
    end

    context '新規投稿がうまくいかないとき' do
      it 'textと画像の療法が空だと保存できない' do
        @early.text = nil
        @early.image = nil
        @early.valid?
        expect(@early.errors.full_messages).to include("Text can't be blank")
      end
    end
  end
end
