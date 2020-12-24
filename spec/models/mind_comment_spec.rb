require 'rails_helper'

RSpec.describe MindComment, type: :model do
  before do
    @mind_comment = FactoryBot.build(:mind_comment)
  end
  describe 'コメント投稿' do
    context 'コメント投稿がうまくいくとき' do
      it 'contentが存在すれば保存できる' do
        expect(@mind_comment).to be_valid
      end
    end

    context 'コメント投稿がうまくいかないとき' do
      it 'contentが空だと保存できない' do
        @mind_comment.content = nil
        @mind_comment.valid?
        expect(@mind_comment.errors.full_messages).to include("Content translation missing: ja.activerecord.errors.models.mind_comment.attributes.content.blank")
      end
    end
  end
end
