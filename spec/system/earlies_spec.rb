require 'rails_helper'

# views/tops/index.html.erbの71行目の部分テンプレートのコメントアウトを外してから実行する

RSpec.describe "新規投稿", type: :system do
  before do
    @user = FactoryBot.create(:user)
    @early_text = Faker::Lorem.sentence
  end

  context '新規投稿ができるとき' do
    it 'ログインしたユーザーは新規投稿できる' do
      # ログインする
      sign_in(@user)
      # カテゴリー選択のリンクがあることを確認する
      expect(page).to have_content('カテゴリーを選択してください')
      # 該当カテゴリーページに遷移する
      visit earlies_path
      # 投稿ページに遷移する
      visit new_early_path
      # textフォームに情報を入力する
      fill_in 'early_text', with: @early_text
      #添付する画像を定義する
      image_path = Rails.root.join('public/images/test_image.png')
      # 画像選択フォームに画像を添付する
      attach_file('early[image]', image_path, make_visible: true)
      # 送信するとモデルのカウントが1上がることを確認する
      expect {
        find('input[name="commit"]').click
      }.to change { Early.count }.by(1)
      # 該当カテゴリー一覧ページに遷移する
      expect(current_path).to eq earlies_path
      # 該当カテゴリー一覧ページに先程投稿した内容の投稿が存在するか確認する(画像)
      expect(page).to have_selector("img")
      # 該当カテゴリー一覧ページに先程投稿した内容の投稿が存在するか確認する(テキスト)
      expect(page).to have_content(@early_text)
    end
  end

  context '新規投稿ができないとき' do
    it 'ログインしていないユーザーは新規投稿ページに遷移できない' do
      # トップページに遷移する
      visit root_path
      # カテゴリー選択のリンクがあることを確認する
      expect(page).to have_content('カテゴリーを選択してください')
      # 該当カテゴリーページに遷移する
      visit earlies_path
      # 新規投稿ページへのリンクがないことを確認する
      expect(page).to have_no_content('投稿する')
    end
  end
end

RSpec.describe "投稿編集", type: :system do
  before do
    @early1 = FactoryBot.create(:early)
    @early2 = FactoryBot.create(:early)
  end

  context '投稿編集できるとき' do
    it 'ログインしたユーザーは自分が投稿したツイートの編集ができる' do
      # 投稿1をしたユーザーでログインする
      visit new_user_session_path
      fill_in 'メールアドレス', with: @early1.user.email
      fill_in 'パスワード', with: @early1.user.password
      find('input[name="commit"]').click
      # カテゴリー選択のリンクがあることを確認する
      expect(page).to have_content('カテゴリーを選択してください')
      # 該当カテゴリーページに遷移する
      visit earlies_path
      # 投稿1の詳細ページに遷移する
      visit early_path(@early1)
      # 投稿1に編集ボタンがあることを確認する
      expect(page).to have_content('編集する')
      # 編集ページへ遷移する
      visit edit_early_path(@early1)
      # すでに投稿済みの内容がフォームに入っていることを確認する
      expect(page).to have_content(@early1.text)
      expect(page).to have_selector("img")
      # 投稿を編集する
      fill_in 'early_text', with: "#{@early1.text}+あいうえお"
      image_path = Rails.root.join('public/images/test_image2.png')
      attach_file('early[image]', image_path, make_visible: true)
      # 編集してもモデルのカウントは変わらないことを確認する
      expect{
        find('input[name="commit"]').click
      }.to change { Early.count }.by(0)
      # 投稿一覧ページに先程投稿した内容の投稿が存在するか確認する(画像)
      expect(page).to have_selector("img")
      # 投稿一覧ページに先程投稿した内容の投稿が存在するか確認する(テキスト)
      expect(page).to have_content(@early1.text)
    end
  end

  context '投稿編集できないとき' do
    it 'ログインしたユーザー以外が投稿した内容の編集画面には遷移できない' do
      # 投稿1をしたユーザーでログインする
      visit new_user_session_path
      fill_in 'メールアドレス', with: @early1.user.email
      fill_in 'パスワード', with: @early1.user.password
      find('input[name="commit"]').click
      # カテゴリー選択のリンクがあることを確認する
      expect(page).to have_content('カテゴリーを選択してください')
      # 該当カテゴリーページに遷移する
      visit earlies_path
      # 投稿2の詳細ページに遷移する
      visit early_path(@early2)
      # 投稿2に編集ボタンが無いことを確認する
      expect(page).to have_no_content('編集する')
    end

    it 'ログインしていないと投稿編集画面には遷移できない' do
      # トップページにいる
      visit root_path
      # カテゴリー選択のリンクがあることを確認する
      expect(page).to have_content('カテゴリーを選択してください')
      # 該当カテゴリーページに遷移する
      visit earlies_path
      # 投稿1の詳細ページに遷移する
      visit early_path(@early1)
      # 投稿1に編集ボタンが無いことを確認する
      expect(page).to have_no_content('編集する')
      # 投稿2の詳細ページに遷移する
      visit early_path(@early2)
      # 投稿2に編集ボタンが無いことを確認する
      expect(page).to have_no_content('編集する')
    end
  end
end

RSpec.describe "投稿削除", type: :system do
  before do
    @early1 = FactoryBot.create(:early)
    @early2 = FactoryBot.create(:early)
  end

  context '投稿削除ができるとき' do
    it 'ログインしたユーザーは自らが投稿した内容を削除できる' do
      # 投稿1をしたユーザーでログインする
      visit new_user_session_path
      fill_in 'メールアドレス', with: @early1.user.email
      fill_in 'パスワード', with: @early1.user.password
      find('input[name="commit"]').click
      # カテゴリー選択のリンクがあることを確認する
      expect(page).to have_content('カテゴリーを選択してください')
      # 該当カテゴリーページに遷移する
      visit earlies_path
      # 投稿1の詳細ページに遷移する
      visit early_path(@early1)
      # 投稿1に削除ボタンがあることを確認する
      expect(page).to have_content('削除する')
      # 投稿を削除するとレコードの数が1減ることを確認する
      expect{
        find_link("削除する", href: early_path(@early1)).click
      }.to change { Early.count }.by(-1)
      # 投稿一覧ページに遷移する
      visit earlies_path
      # 投稿一覧ページは投稿1の内容が存在しないことを確認する(画像)
      expect(page).to have_no_content(@early1.image)
      # 投稿一覧ページは投稿1の内容が存在しないことを確認する(テキスト)
      expect(page).to have_no_content(@early1.text)
    end
  end
  context '投稿削除できないとき' do
    it 'ログインしたユーザーは自分以外が投稿した内容を削除できない' do
      # 投稿1をしたユーザーでログインする
      visit new_user_session_path
      fill_in 'メールアドレス', with: @early1.user.email
      fill_in 'パスワード', with: @early1.user.password
      find('input[name="commit"]').click
      # 投稿2に削除ボタンがないことを確認する
      expect(page).to have_no_link '削除する', href: early_path(@early2)
    end
    it 'ログインしていないと投稿の削除ボタンがない' do
      # トップページに移動する
      visit root_path
      # カテゴリー選択のリンクがあることを確認する
      expect(page).to have_content('カテゴリーを選択してください')
      # 該当カテゴリーページに遷移する
      visit earlies_path
      # 投稿1の詳細ページに遷移する
      visit early_path(@early1)
      # 投稿1に削除ボタンがないことを確認する
      expect(page).to have_no_link '削除する', href: early_path(@early1)
      # 該当カテゴリーページに遷移する
      visit earlies_path
      # 投稿2の詳細ページに遷移する
      visit early_path(@early2)
      # 投稿2に削除ボタンがないことを確認する
      expect(page).to have_no_link '削除する', href: early_path(@early2)
    end
  end
end

RSpec.describe '投稿詳細', type: :system do
  before do
    @user = FactoryBot.create(:user)
    @early = FactoryBot.create(:early)
  end
  it 'ログインしたユーザーはツイート詳細ページに遷移してコメント投稿欄が表示される' do
    # ログインする
    sign_in(@user)
    # カテゴリー選択のリンクがあることを確認する
    expect(page).to have_content('カテゴリーを選択してください')
    # 該当カテゴリーページに遷移する
    visit earlies_path
    # 投稿詳細ページに遷移する
    visit early_path(@early)
    # 詳細ページにツイートの内容が含まれている
    expect(page).to have_selector("img")
    expect(page).to have_content(@early.text)
    # コメント用のフォームが存在する
    expect(page).to have_content("コメント")
  end
  it 'ログインしていない状態でツイート詳細ページに遷移できるもののコメント投稿欄が表示されない' do
    # トップページに移動する
    visit root_path
    # カテゴリー選択のリンクがあることを確認する
    expect(page).to have_content('カテゴリーを選択してください')
    # 該当カテゴリーページに遷移する
    visit earlies_path
    # 投稿詳細ページに遷移する
    visit early_path(@early)
    # 詳細ページにツイートの内容が含まれている
    expect(page).to have_selector("img")
    expect(page).to have_content(@early.text)
    # フォームが存在しないことを確認する
    expect(page).to have_no_selector("content_field")
    # 「コメントの投稿には新規登録/ログインが必要です」が表示されていることを確認する
    expect(page).to have_content("※コメントの投稿には新規登録/ログインが必要です")
  end
end