require 'rails_helper'

# views/tops/index.html.erbの71行目の部分テンプレートのコメントアウトを外してから実行する

RSpec.describe "新規投稿", type: :system do
  before do
    @user = FactoryBot.create(:user)
    @saving_text = Faker::Lorem.sentence
  end

  context '新規投稿ができるとき' do
    it 'ログインしたユーザーは新規投稿できる' do
      # ログインする
      sign_in(@user)
      # カテゴリー選択のリンクがあることを確認する
      expect(page).to have_content('カテゴリーを選択してください')
      # 該当カテゴリーページに遷移する
      visit savings_path
      # 投稿ページに遷移する
      visit new_saving_path
      # textフォームに情報を入力する
      fill_in 'saving_text', with: @saving_text
      #添付する画像を定義する
      image_path = Rails.root.join('public/images/test_image.png')
      # 画像選択フォームに画像を添付する
      attach_file('saving[image]', image_path, make_visible: true)
      # 送信するとDaietモデルのカウントが1上がることを確認する
      expect {
        find('input[name="commit"]').click
      }.to change { Saving.count }.by(1)
      # 該当カテゴリー一覧ページに遷移する
      expect(current_path).to eq savings_path
      # 該当カテゴリー一覧ページに先程投稿した内容の投稿が存在するか確認する(画像)
      expect(page).to have_selector("img")
      # 該当カテゴリー一覧ページに先程投稿した内容の投稿が存在するか確認する(テキスト)
      expect(page).to have_content(@saving_text)
    end
  end

  context '新規投稿ができないとき' do
    it 'ログインしていないユーザーは新規投稿ページに遷移できない' do
      # トップページに遷移する
      visit root_path
      # カテゴリー選択のリンクがあることを確認する
      expect(page).to have_content('カテゴリーを選択してください')
      # 該当カテゴリーページに遷移する
      visit savings_path
      # 新規投稿ページへのリンクがないことを確認する
      expect(page).to have_no_content('投稿する')
    end
  end
end
