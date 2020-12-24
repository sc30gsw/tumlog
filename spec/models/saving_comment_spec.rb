require 'rails_helper'

RSpec.describe SavingComment, type: :model do
  before do
    @saving_comment = FactoryBot.build(:saving_comment)
  end
  describe 'コメント投稿' do
    context 'コメント投稿がうまくいくとき' do
      it 'contentが存在すれば保存できる' do
        expect(@saving_comment).to be_valid
      end
    end

    context 'コメント投稿がうまくいかないとき' do
      it 'contentが空だと保存できない' do
        @saving_comment.content = nil
        @saving_comment.valid?
        expect(@saving_comment.errors.full_messages).to include("Content translation missing: ja.activerecord.errors.models.saving_comment.attributes.content.blank")
      end
    end
  end
end
