require 'rails_helper'

RSpec.describe LearnComment, type: :model do
  before do
    @learn_comment = FactoryBot.build(:learn_comment)
  end
  describe 'コメント投稿' do
    context 'コメント投稿がうまくいくとき' do
      it 'contentが存在すれば保存できる' do
        expect(@learn_comment).to be_valid
      end
    end

    context 'コメント投稿がうまくいかないとき' do
      it 'contentが空だと保存できない' do
        @learn_comment.content = nil
        @learn_comment.valid?
        expect(@learn_comment.errors.full_messages).to include("Content translation missing: ja.activerecord.errors.models.learn_comment.attributes.content.blank")
      end
    end
  end
end
