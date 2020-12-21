require 'rails_helper'

RSpec.describe Learn, type: :model do
  before do
    @learn = FactoryBot.build(:learn)
  end

  describe '新規投稿' do
    context '新規投稿がうまくいくとき' do
      it 'textが空でも保存できる' do
        @learn.text = nil
        expect(@learn).to be_valid
      end
      it '画像が空でも保存できる' do
        @learn.image = nil
        expect(@learn).to be_valid
      end
      it 'textと画像の両方があれば保存できる' do
        expect(@learn).to be_valid
      end
    end

    context '新規投稿がうまくいかないとき' do
      it 'textと画像の療法が空だと保存できない' do
        @learn.text = nil
        @learn.image = nil
        @learn.valid?
        expect(@learn.errors.full_messages).to include("Text can't be blank")
      end
    end
  end
end