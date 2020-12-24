require 'rails_helper'

RSpec.describe EarlyComment, type: :model do
  before do
    @early_comment = FactoryBot.build(:early_comment)
  end
  describe 'コメント投稿' do
    context 'コメント投稿がうまくいくとき' do
      it 'contentが存在すれば保存できる' do
        expect(@early_comment).to be_valid
      end
    end

    context 'コメント投稿がうまくいかないとき' do
      it 'contentが空だと保存できない' do
        @early_comment.content = nil
        @early_comment.valid?
        expect(@early_comment.errors.full_messages).to include("Content translation missing: ja.activerecord.errors.models.early_comment.attributes.content.blank")
      end
    end
  end
end
