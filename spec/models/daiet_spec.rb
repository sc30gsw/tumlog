require 'rails_helper'

RSpec.describe Daiet, type: :model do
  before do
    @daiet = FactoryBot.build(:daiet)
  end

  describe '新規投稿' do
    context '新規投稿がうまくいくとき' do
      it 'textが空でも保存できる' do
        @daiet.text = nil
        expect(@daiet).to be_valid
      end
      it '画像が空でも保存できる' do
        @daiet.image = nil
        expect(@daiet).to be_valid
      end
      it 'textと画像の両方があれば保存できる' do
        expect(@daiet).to be_valid
      end
    end

    context '新規投稿がうまくいかないとき' do
      it 'textと画像の療法が空だと保存できない' do
        @daiet.text = nil
        @daiet.image = nil
        @daiet.valid?
        expect(@daiet.errors.full_messages).to include("Text can't be blank")
      end
    end
  end
end