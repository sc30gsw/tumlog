require 'rails_helper'

RSpec.describe "LearnComments", type: :system do
  before do
    @user = FactoryBot.create(:user)
    @learn = FactoryBot.create(:learn)
    @learn_comment = "習慣化"
  end
  it 'ログインしたユーザーは投稿詳細ページでコメント投稿できる' do
    # ログインする
    sign_in(@user)
    # カテゴリー選択のリンクがあることを確認する
    expect(page).to have_content('カテゴリーを選択してください')
    # 該当カテゴリーページに遷移する
    visit learns_path
    # 投稿詳細ページに遷移する
    visit learn_path(@learn)
    # フォームに情報を入力する
    fill_in 'learn_comment_content', with: @learn_comment
    # コメントを送信すると、Commentモデルのカウントが1上がることを確認する
    expect {
      find('input[name="commit"]').click
    }.to change { LearnComment.count }.by(1)
    # 詳細ページにリダイレクトされることを確認する
    expect(current_path).to eq learn_path(@learn)
    # 詳細ページ上に先ほどのコメント内容が含まれていることを確認する
    expect(page).to have_content @learn_comment
  end
end
