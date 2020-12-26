require 'rails_helper'

RSpec.describe Mind, type: :model do
  before do
    @mind = FactoryBot.build(:mind)
  end

  describe '新規投稿' do
    context '新規投稿がうまくいくとき' do
      it 'textが空でも保存できる' do
        @mind.text = nil
        expect(@mind).to be_valid
      end
      it '画像が空でも保存できる' do
        @mind.image = nil
        expect(@mind).to be_valid
      end
      it 'textと画像の両方があれば保存できる' do
        expect(@mind).to be_valid
      end
    end

    context '新規投稿がうまくいかないとき' do
      it 'textと画像の療法が空だと保存できない' do
        @mind.text = nil
        @mind.image = nil
        @mind.valid?
        expect(@mind.errors.full_messages).to include("Text can't be blank")
      end
    end
  end
end