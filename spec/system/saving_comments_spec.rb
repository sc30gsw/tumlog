require 'rails_helper'

RSpec.describe "SavingComments", type: :system do
  before do
    @user = FactoryBot.create(:user)
    @saving = FactoryBot.create(:saving)
    @saving_comment = "習慣化"
  end
  it 'ログインしたユーザーは投稿詳細ページでコメント投稿できる' do
    # ログインする
    sign_in(@user)
    # カテゴリー選択のリンクがあることを確認する
    expect(page).to have_content('カテゴリーを選択してください')
    # 該当カテゴリーページに遷移する
    visit savings_path
    # 投稿詳細ページに遷移する
    visit saving_path(@saving)
    # フォームに情報を入力する
    fill_in 'saving_comment_content', with: @saving_comment
    # コメントを送信すると、Commentモデルのカウントが1上がることを確認する
    expect {
      find('input[name="commit"]').click
    }.to change { SavingComment.count }.by(1)
    # 詳細ページにリダイレクトされることを確認する
    expect(current_path).to eq saving_path(@saving)
    # 詳細ページ上に先ほどのコメント内容が含まれていることを確認する
    expect(page).to have_content @saving_comment
  end
end
