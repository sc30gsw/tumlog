require 'rails_helper'

RSpec.describe "MindComments", type: :system do
  before do
    @user = FactoryBot.create(:user)
    @mind = FactoryBot.create(:mind)
    @mind_comment = "習慣化"
  end
  it 'ログインしたユーザーは投稿詳細ページでコメント投稿できる' do
    # ログインする
    sign_in(@user)
    # カテゴリー選択のリンクがあることを確認する
    expect(page).to have_content('カテゴリーを選択してください')
    # 該当カテゴリーページに遷移する
    visit minds_path
    # 投稿詳細ページに遷移する
    visit mind_path(@mind)
    # フォームに情報を入力する
    fill_in 'mind_comment_content', with: @mind_comment
    # コメントを送信すると、Commentモデルのカウントが1上がることを確認する
    expect {
      find('input[name="commit"]').click
    }.to change { MindComment.count }.by(1)
    # 詳細ページにリダイレクトされることを確認する
    expect(current_path).to eq mind_path(@mind)
    # 詳細ページ上に先ほどのコメント内容が含まれていることを確認する
    expect(page).to have_content @mind_comment
  end
end
