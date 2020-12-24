require 'rails_helper'

RSpec.describe ExerciseComment, type: :model do
  before do
    @exercise_comment = FactoryBot.build(:exercise_comment)
  end
  describe 'コメント投稿' do
    context 'コメント投稿がうまくいくとき' do
      it 'contentが存在すれば保存できる' do
        expect(@exercise_comment).to be_valid
      end
    end

    context 'コメント投稿がうまくいかないとき' do
      it 'contentが空だと保存できない' do
        @exercise_comment.content = nil
        @exercise_comment.valid?
        expect(@exercise_comment.errors.full_messages).to include("Content translation missing: ja.activerecord.errors.models.exercise_comment.attributes.content.blank")
      end
    end
  end
end
