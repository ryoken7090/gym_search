require 'rails_helper'
RSpec.describe Tagging, type: :system do
  before do
    @city = FactoryBot.create(:city, name: 'テスト区')
    FactoryBot.create(:first_tag)
    FactoryBot.create(:second_tag)
    FactoryBot.create(:third_tag)
  end
  describe 'Function to create new facility and Tagging' do
    context 'When you have selected the necessary items and tags' do
      it 'can save tagging' do
        visit new_facility_path
        fill_in '施設名', with: 'テスト施設'
        select 'テスト区', from: 'facility_city_id'
        check 'Tag_A'
        check 'Tag_B'
        click_button '登録する'
        click_button '登録する'
        expect(page).to have_content 'Tag_A'
        expect(page).to have_content 'Tag_B'
      end
    end
  end
  describe 'Function to edit tagging' do
    context 'When you change tags' do
      it 'can update tagging' do
        visit new_facility_path
        fill_in '施設名', with: 'テスト施設'
        select 'テスト区', from: 'facility_city_id'
        check 'Tag_A'
        check 'Tag_B'
        click_button '登録する'
        click_button '登録する'
        expect(page).to have_content 'Tag_A'
        expect(page).to have_content 'Tag_B'
        click_link '施設情報を編集する'
        uncheck 'Tag_A'
        check 'Tag_C'
        click_button '更新する'
        expect(page).to have_content 'Tag_B'
        expect(page).to have_content 'Tag_C'
      end
    end
  end
end
