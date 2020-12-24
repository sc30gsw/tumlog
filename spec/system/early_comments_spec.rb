require 'rails_helper'

RSpec.describe "EarlyComments", type: :system do
  before do
    @user = FactoryBot.create(:user)
    @early = FactoryBot.create(:early)
    @early_comment = "習慣化"
  end
  it 'ログインしたユーザーは投稿詳細ページでコメント投稿できる' do
    # ログインする
    sign_in(@user)
    # カテゴリー選択のリンクがあることを確認する
    expect(page).to have_content('カテゴリーを選択してください')
    # 該当カテゴリーページに遷移する
    visit earlies_path
    # 投稿詳細ページに遷移する
    visit early_path(@early)
    # フォームに情報を入力する
    fill_in 'early_comment_content', with: @early_comment
    # コメントを送信すると、Commentモデルのカウントが1上がることを確認する
    expect {
      find('input[name="commit"]').click
    }.to change { EarlyComment.count }.by(1)
    # 詳細ページにリダイレクトされることを確認する
    expect(current_path).to eq early_path(@early)
    # 詳細ページ上に先ほどのコメント内容が含まれていることを確認する
    expect(page).to have_content @early_comment
  end
end
