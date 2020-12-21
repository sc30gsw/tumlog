require 'rails_helper'

RSpec.describe Exercise, type: :model do
  before do
    @exercise = FactoryBot.build(:exercise)
  end

  describe '新規投稿' do
    context '新規投稿がうまくいくとき' do
      it 'textが空でも保存できる' do
        @exercise.text = nil
        expect(@exercise).to be_valid
      end
      it '画像が空でも保存できる' do
        @exercise.image = nil
        expect(@exercise).to be_valid
      end
      it 'textと画像の両方があれば保存できる' do
        expect(@exercise).to be_valid
      end
    end

    context '新規投稿がうまくいかないとき' do
      it 'textと画像の療法が空だと保存できない' do
        @exercise.text = nil
        @exercise.image = nil
        @exercise.valid?
        expect(@exercise.errors.full_messages).to include("Text can't be blank")
      end
    end
  end
end