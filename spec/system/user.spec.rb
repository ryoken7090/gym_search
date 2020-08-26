require 'rails_helper'
RSpec.describe User, type: :system do
  describe 'Sign Up' do
    context 'when input (name,email,password,password confirmation) and press the register button' do
      it "can create user and can login/logout as the user" do
        visit root_path
        click_link '新規登録'
        fill_in 'user_name', with: 'Test User'
        fill_in 'user_email', with: 'Test@example.com'
        fill_in 'user_password', with: 'password'
        fill_in 'user_password_confirmation', with: 'password'
        click_button 'アカウント登録'
        expect(page).to have_content 'Test Userさんのページ'
        expect(page).to have_content 'アカウント登録が完了しました。'
        click_link 'ログアウト'
        expect(page).to have_content 'ログアウトしました。'
        click_link 'ログイン'
        fill_in 'user_email', with: 'Test@example.com'
        fill_in 'user_password', with: 'password'
        click_button 'ログイン'
        expect(page).to have_content 'ログインしました。'
        click_link 'マイページ'
        expect(page).to have_content 'Test Userさんのページ'
      end
    end
    context 'when input is not enough' do
      it "cannot signup" do
        visit root_path
        click_link '新規登録'
        click_button 'アカウント登録'
        expect(page).to have_content 'Eメールを入力してください'
        expect(page).to have_content 'パスワードを入力してください'
        expect(page).to have_content 'ユーザー名を入力してください'
        fill_in 'user_name', with: ''
        fill_in 'user_email', with: 'Test@example.com'
        fill_in 'user_password', with: 'password'
        fill_in 'user_password_confirmation', with: 'password'
        click_button 'アカウント登録'
        expect(page).to have_content 'ユーザー名を入力してください'
        fill_in 'user_name', with: 'Test User'
        fill_in 'user_email', with: ''
        fill_in 'user_password', with: 'password'
        fill_in 'user_password_confirmation', with: 'password'
        click_button 'アカウント登録'
        expect(page).to have_content 'Eメールを入力してください'
        fill_in 'user_name', with: 'Test User'
        fill_in 'user_email', with: 'Test@example.com'
        fill_in 'user_password', with: ''
        fill_in 'user_password_confirmation', with: 'password'
        click_button 'アカウント登録'
        expect(page).to have_content 'パスワード（確認用）とパスワードの入力が一致しません'
      end
    end

  end
end
