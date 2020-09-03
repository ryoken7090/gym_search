require 'rails_helper'
RSpec.describe Facility, type: :system do
  before do
    @city = create(:city, name: 'テスト区')
    create(:city, name: 'テスト市')
    @user = create(:user)
    login_as @user
  end
  describe 'Function to create new facility' do
    context 'when input necessary information' do
      it 'can save and edit and destroy the data' do
        visit root_path
        click_link '新規施設登録'
        fill_in '施設名', with: 'テスト施設'
        select 'テスト区', from: '市区町村(必須)'
        click_button '投稿する'
        expect(page).to have_content '施設情報を作成しました'
        expect(page).to have_content 'テスト施設'
        expect(page).to have_content 'テスト区'
        click_link '編集する'
        fill_in '施設名', with: 'テスト施設ver2'
        select 'テスト市', from: '市区町村(必須)'
        click_button '投稿する'
        expect(page).to have_content '施設情報を編集しました'
        expect(page).to have_content 'テスト施設ver2'
        expect(page).to have_content 'テスト市'
        click_link '削除する'
        page.driver.browser.switch_to.alert.accept
        expect(page).to have_content '施設情報を削除しました'
      end
    end
    context 'when input is not enough' do
      it 'cannot save date' do
        visit root_path
        click_link '新規施設登録'
        fill_in '施設名', with: ''
        select 'テスト区', from: '市区町村(必須)'
        click_button '投稿する'
        expect(page).to have_content '施設名は1文字以上で入力してください'
        fill_in '施設名', with: 'テスト施設'
        select '選択なし', from: '市区町村(必須)'
        click_button '投稿する'
        expect(page).to have_content '市区町村を入力してください'
      end
    end

    context 'When items are put' do
      it 'save all items' do
        visit new_facility_path
        fill_in '施設名', with: 'テスト施設'
        select 'テスト区', from: '市区町村(必須)'
        fill_in 'ベンチプレス', with: ''
        fill_in 'パワーラック', with: '1'
        fill_in 'フラットベンチ', with: '2'
        fill_in 'アジャスタブルベンチ', with: '3'
        fill_in 'スミスマシン', with: '4'
        fill_in 'ケーブルプーリー', with: '5'
        fill_in '月会費', with: '10000'
        select '不可', from: 'facility_drop'
        select 'あり', from: 'facility_parking'
        select 'なし', from: 'facility_shower'
        select '可能', from: 'facility_recordable'
        select 'なし', from: 'facility_visiter'
        fill_in '月会費', with: '10000'
        select '○', from: 'facility_accessible_ten_min'
        select '✕', from: 'facility_trainer'
        select 'あり', from: 'facility_open_all_time'
        fill_in '最寄り駅', with: '新宿'
        fill_in '最寄り駅からの距離', with: '徒歩10分'
        fill_in '電話番号', with: '000-0000-0000'
        fill_in '定休日', with: 'なし'
        fill_in '営業時間', with: '24時間'
        fill_in '備考', with: '特になし'
        click_button '投稿する'
        expect(page).to have_content 'ベンチプレス台 : 未記入'
        expect(page).to have_content 'パワーラック : 1台'
        expect(page).to have_content 'フラットベンチ : 2台'
        expect(page).to have_content 'アジャスタブルベンチ : 3台'
        expect(page).to have_content 'スミスマシン : 4台'
        expect(page).to have_content 'ケーブルプーリー : 5台'
        expect(page).to have_content '電話番号： 000-0000-0000'
        expect(page).to have_content '最寄り駅： 新宿駅'
        expect(page).to have_content '駅からの距離： 徒歩10分'
        expect(page).to have_content '定休日： なし'
        expect(page).to have_content '営業時間： 24時間'
      end
    end
  end
  describe 'search function' do
    context 'when 25 facilities register' do
      it 'divide the search result into three' do
        25.times {create(:facility, poster_id: @user.id)}
        visit root_path
        click_button 'この条件で一括検索'
        expect(all('.card').size).to eq(10)
        expect(page).to have_selector '.page-item', text: '3'
        expect(page).not_to have_selector '.page-item', text: '4'
        click_link '3'
        expect(all('.card').size).to eq(5)
      end
    end
  end
end
