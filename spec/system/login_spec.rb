require 'rails_helper'

describe 'トップ画面のテスト' do
  before do
    visit root_path
  end

  context '表示内容の確認' do
    it 'URLが正しい' do
      expect(current_path).to eq '/'
    end
    it 'ガイドリンクが表示される' do
        guide_link = find_all('a')[0].native.inner_text
        expect(guide_link).to match(/まずはこちらをみてください！！！/)
    end
    it 'ガイドリンクの内容が正しい' do
        guide_link = find_all('a')[0].native.inner_text
        expect(page).to have_link guide_link, href: guide_path
    end
    it 'ログインリンクが表示される' do
        log_in_link = find_all('a')[1].native.inner_text
        expect(log_in_link).to match(/ログイン/)
    end
    it 'ログインリンクの内容が正しい' do
        log_in_link = find_all('a')[1].native.inner_text
        expect(page).to have_link log_in_link, href: new_user_session_path
    end
    it 'サインアップリンクが表示される' do
        sign_up_link = find_all('a')[2].native.inner_text
        expect(sign_up_link).to match(/サインアップ/)
    end
    it 'サインアップリンクの内容が正しい' do
        sign_up_link = find_all('a')[2].native.inner_text
        expect(page).to have_link sign_up_link, href: new_user_registration_path
    end
    it 'ゲストログインリンクが表示される' do
        guest_link = find_all('a')[3].native.inner_text
        expect(guest_link).to match("ゲストログイン(閲覧用)")
    end
    it 'ゲストログインリンクの内容が正しい' do
        guest_link = find_all('a')[3].native.inner_text
        expect(page).to have_link guest_link, href: users_guest_sign_in_path
    end
  end
end

describe 'ガイド画面のテスト' do
  before do
   visit guide_path
  end
  context '表示内容の確認' do
    it 'URLが正しい' do
      expect(current_path).to eq '/guide'
    end
  end
end

describe 'ユーザ新規登録のテスト' do
  before do
    visit new_user_registration_path
  end

  context '表示内容の確認' do
    it 'URLが正しい' do
      expect(current_path).to eq '/users/sign_up'
    end
    it '「新規会員登録」と表示される' do
      expect(page).to have_content '新規会員登録'
    end
    it 'nicknameフォームが表示される' do
      expect(page).to have_field 'user[nickname]'
    end
    it 'お住まいの地域フォームが表示される' do
      expect(page).to have_field 'user[prefecture]'
    end
    it '自己紹介フォームが表示される' do
      expect(page).to have_field 'user[introduction]'
    end
    it 'emailフォームが表示される' do
      expect(page).to have_field 'user[email]'
    end
    it 'passwordフォームが表示される' do
      expect(page).to have_field 'user[password]'
    end
    it 'password_confirmationフォームが表示される' do
      expect(page).to have_field 'user[password_confirmation]'
    end
    it '新規登録する！ボタンが表示される' do
      expect(page).to have_button '新規登録する！'
    end
  end
end

describe 'ユーザログイン' do
  let(:user) { create(:user) }
  before do
    visit new_user_session_path
  end

  context '表示内容の確認' do
    it 'URLが正しい' do
      expect(current_path).to eq '/users/sign_in'
    end
    it '「会員ログイン」と表示される' do
      expect(page).to have_content '会員ログイン'
    end
    it 'nicknameフォームが表示される' do
      expect(page).to have_field 'user[nickname]'
    end
    it 'passwordフォームが表示される' do
      expect(page).to have_field 'user[password]'
    end
    it 'ログインボタンが表示される' do
      expect(page).to have_button 'ログイン'
    end
    it 'emailフォームは表示されない' do
      expect(page).not_to have_field 'user[email]'
    end
  end

  context 'ログイン成功のテスト' do
    before do
      fill_in 'user[nickname]', with: user.nickname
      fill_in 'user[password]', with: user.password
      click_button 'ログイン'
    end
    it 'ログイン後のリダイレクト先が、マイページになっている' do
      expect(current_path).to eq '/users/' + user.id.to_s
    end
  end
  context 'ログイン失敗のテスト' do
    before do
      fill_in 'user[nickname]', with: ''
      fill_in 'user[password]', with: ''
      click_button 'ログイン'
    end
    it 'ログインに失敗し、ログイン画面にリダイレクトされる' do
      expect(current_path).to eq '/users/sign_in'
    end
  end
end