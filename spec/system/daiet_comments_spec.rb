require 'rails_helper'

RSpec.describe "DaietComments", type: :system do
  before do
    @user = FactoryBot.create(:user)
    @daiet = FactoryBot.create(:daiet)
    @daiet_comment = "習慣化"
  end
  it 'ログインしたユーザーは投稿詳細ページでコメント投稿できる' do
    # ログインする
    sign_in(@user)
    # カテゴリー選択のリンクがあることを確認する
    expect(page).to have_content('カテゴリーを選択してください')
    # 該当カテゴリーページに遷移する
    visit daiets_path
    # 投稿詳細ページに遷移する
    visit daiet_path(@daiet)
    # フォームに情報を入力する
    fill_in 'daiet_comment_content', with: @daiet_comment
    # コメントを送信すると、Commentモデルのカウントが1上がることを確認する
    expect {
      find('input[name="commit"]').click
    }.to change { DaietComment.count }.by(1)
    # 詳細ページにリダイレクトされることを確認する
    expect(current_path).to eq daiet_path(@daiet)
    # 詳細ページ上に先ほどのコメント内容が含まれていることを確認する
    expect(page).to have_content @daiet_comment
  end
end
