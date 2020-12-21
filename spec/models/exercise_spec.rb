require 'rails_helper'

RSpec.describe Exercise, type: :model do
  before do
    @exercise = FactoryBot.build(:exercise)
  end

  describe '新規投稿' do
    context '新規投稿がうまくいくとき' do
      it 'textのみあれば保存できる'
    end
  end