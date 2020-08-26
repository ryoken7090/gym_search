require 'rails_helper'
RSpec.describe Tagging, type: :system do
  before do
    @city = create(:city, name: 'テスト区')
    @user = create(:user)
    login_as @user
    create(:first_tag)
    create(:second_tag)
    create(:third_tag)
  end
  describe 'Function to create new facility and Tagging' do
    context 'When selected the necessary items and tags' do
      it 'can save tagging' do
        visit new_facility_path
        fill_in '施設名', with: 'テスト施設'
        select 'テスト区', from: '市区町村(必須)'
        check 'Tag_A'
        check 'Tag_B'
        click_button '投稿する'
        expect(page).to have_content 'Tag_A'
        expect(page).to have_content 'Tag_B'
      end
    end
  end
  describe 'Function to edit tagging' do
    context 'When change tags' do
      it 'can update tagging' do
        visit new_facility_path
        fill_in '施設名', with: 'テスト施設'
        select 'テスト区', from: '市区町村(必須)'
        check 'Tag_A'
        check 'Tag_B'
        click_button '投稿する'
        expect(page).to have_content 'Tag_A'
        expect(page).to have_content 'Tag_B'
        click_link '編集する'
        uncheck 'Tag_A'
        check 'Tag_C'
        click_button '投稿する'
        expect(page).to have_content 'Tag_B'
        expect(page).to have_content 'Tag_C'
      end
    end
  end
end
