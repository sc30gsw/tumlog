require 'rails_helper'

RSpec.describe Saving, type: :model do
  before do
    @saving = FactoryBot.build(:saving)
  end

  describe '新規投稿' do
    context '新規投稿がうまくいくとき' do
      it 'textが空でも保存できる' do
        @saving.text = nil
        expect(@saving).to be_valid
      end
      it '画像が空でも保存できる' do
        @saving.image = nil
        expect(@saving).to be_valid
      end
      it 'textと画像の両方があれば保存できる' do
        expect(@saving).to be_valid
      end
    end

    context '新規投稿がうまくいかないとき' do
      it 'textと画像の療法が空だと保存できない' do
        @saving.text = nil
        @saving.image = nil
        @saving.valid?
        expect(@saving.errors.full_messages).to include("Text can't be blank")
      end
    end
  end
end