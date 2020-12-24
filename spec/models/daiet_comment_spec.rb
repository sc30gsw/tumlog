require 'rails_helper'

RSpec.describe DaietComment, type: :model do
  before do
    @daiet_comment = FactoryBot.build(:daiet_comment)
  end

  describe 'コメント投稿' do
    context 'コメント投稿がうまくいくとき' do
      it 'contentが存在すれば保存できる' do
        expect(@daiet_comment).to be_valid
      end
    end

    context 'コメント投稿がうまくいかないとき' do
      it 'contentが空だと保存できない' do
        @daiet_comment.content = nil
        @daiet_comment.valid?
        expect(@daiet_comment.errors.full_messages).to include("Content translation missing: ja.activerecord.errors.models.daiet_comment.attributes.content.blank")
      end
    end
  end
end
