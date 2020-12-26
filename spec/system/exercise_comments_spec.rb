require 'rails_helper'

RSpec.describe "ExerciseComments", type: :system do
  before do
    @user = FactoryBot.create(:user)
    @exercise = FactoryBot.create(:exercise)
    @exercise_comment = "習慣化"
  end
  it 'ログインしたユーザーは投稿詳細ページでコメント投稿できる' do
    # ログインする
    sign_in(@user)
    # カテゴリー選択のリンクがあることを確認する
    expect(page).to have_content('カテゴリーを選択してください')
    # 該当カテゴリーページに遷移する
    visit exercises_path
    # 投稿詳細ページに遷移する
    visit exercise_path(@exercise)
    # フォームに情報を入力する
    fill_in 'exercise_comment_content', with: @exercise_comment
    # コメントを送信すると、Commentモデルのカウントが1上がることを確認する
    expect {
      find('input[name="commit"]').click
    }.to change { ExerciseComment.count }.by(1)
    # 詳細ページにリダイレクトされることを確認する
    expect(current_path).to eq exercise_path(@exercise)
    # 詳細ページ上に先ほどのコメント内容が含まれていることを確認する
    expect(page).to have_content @exercise_comment
  end
end
