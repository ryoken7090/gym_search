require 'rails_helper'
RSpec.describe Facility, type: :system do
  before do
    @facility = FactoryBot.create(:city, name: 'テスト区')
    FactoryBot.create(:city, name: 'テスト市')
  end
  describe 'Function to create new facility' do
    context 'when you input the name and and press the register button and press the register button on confirmation page' do
      it 'can save data' do
        visit new_facility_path
        fill_in '施設名', with: 'テスト施設'
        select 'テスト区', from: 'facility_city_id'
        click_button '登録する'
        click_button '登録する'
        expect(page).to have_content 'テスト施設'
        expect(page).to have_content 'テスト区'
      end
    end
    context 'when you input the name and and press the register button and press the back button on confirmation page' do
      it 'can not save data' do
        visit new_facility_path
        fill_in '施設名', with: 'テスト施設'
        select 'テスト区', from: 'facility_city_id'
        click_button '登録する'
        click_button '戻る'
        click_link '施設一覧へ'
        expect(page).not_to have_content 'テスト施設'
      end
    end
    context 'When all items are entered and information is registered' do
      it 'register all items correctry' do
        visit new_facility_path
        fill_in '施設名', with: 'テスト施設'
        select 'テスト区', from: 'facility_city_id'
        select '○', from: 'facility_drop'
        select '○', from: 'facility_parking'
        select '○', from: 'facility_shower'
        select '○', from: 'facility_recordable'
        select '○', from: 'facility_visiter'
        fill_in '月会費', with: '10000'
        select '○', from: 'facility_accessible_ten_min'
        select '○', from: 'facility_trainer'
        select '○', from: 'facility_open_all_time'
        fill_in '最寄り駅', with: '新宿'
        fill_in '最寄り駅からの距離', with: '徒歩10分'
        fill_in '電話番号', with: '000-0000-0000'
        fill_in '定休日', with: 'なし'
        fill_in '営業時間', with: '24時間'
        fill_in '備考', with: '特になし'
        click_button '登録する'
        click_button '登録する'
        expect(all('p')[0]).to have_content 'テスト区'
        expect(all('tbody tr')[0]).to have_content '○'
        expect(all('tbody tr')[1]).to have_content '○'
        expect(all('tbody tr')[2]).to have_content '○'
        expect(all('tbody tr')[3]).to have_content '○'
        expect(all('tbody tr')[4]).to have_content '○'
        expect(all('tbody tr')[5]).to have_content '○'
        expect(all('tbody tr')[6]).to have_content '○'
        expect(all('tbody tr')[7]).to have_content '○'
        expect(all('tbody tr')[8]).to have_content '10000円'
        expect(all('p')[1]).to have_content '特になし'
        expect(all('tbody tr')[9]).to have_content '施設名：テスト施設'
        expect(all('tbody tr')[10]).to have_content '電話番号： 000-0000-0000'
        expect(all('tbody tr')[11]).to have_content '最寄り駅： 新宿駅'
        expect(all('tbody tr')[11]).to have_content '駅からの距離： 徒歩10分'
        expect(all('tbody tr')[12]).to have_content '定休日： なし'
        expect(all('tbody tr')[12]).to have_content '営業時間： 24時間'
      end
    end
  end
  describe 'Functuon to edit facirities' do
    context 'when edit some items' do
      it "update information" do
        @facility = FactoryBot.create(:facility, city_id: @facility.id)
        visit facility_path(@facility)
        click_link '施設情報を編集する'
        select 'テスト市', from: 'facility_city_id'
        select '✕', from: 'facility_drop'
        select '✕', from: 'facility_parking'
        select '✕', from: 'facility_shower'
        select '✕', from: 'facility_recordable'
        # binding.pry
        # select '✕', from: 'facility_visiter'
        fill_in '月会費', with: '9000'
        select '✕', from: 'facility_accessible_ten_min'
        select '✕', from: 'facility_trainer'
        select '✕', from: 'facility_open_all_time'
        fill_in '最寄り駅', with: '渋谷'
        fill_in '最寄り駅からの距離', with: '徒歩5分'
        fill_in '電話番号', with: '000-0000-1234'
        fill_in '定休日', with: 'なし'
        fill_in '営業時間', with: '24時間'
        fill_in '備考', with: '特になし'
        click_button '更新する'
        expect(all('p')[0]).to have_content 'テスト市'
        expect(all('tbody tr')[0]).to have_content '✕'
        expect(all('tbody tr')[1]).to have_content '✕'
        expect(all('tbody tr')[2]).to have_content '✕'
        expect(all('tbody tr')[3]).to have_content '✕'
        expect(all('tbody tr')[4]).to have_content '✕'
        # expect(all('tbody tr')[5]).to have_content '✕'
        expect(all('tbody tr')[6]).to have_content '✕'
        expect(all('tbody tr')[7]).to have_content '✕'
        expect(all('tbody tr')[8]).to have_content '9000円'
        expect(all('p')[1]).to have_content '特になし'
        expect(all('tbody tr')[9]).to have_content '施設名：TEST_NAME1'
        expect(all('tbody tr')[10]).to have_content '電話番号： 000-0000-1234'
        expect(all('tbody tr')[11]).to have_content '最寄り駅： 渋谷駅'
        expect(all('tbody tr')[11]).to have_content '駅からの距離： 徒歩5分'
        expect(all('tbody tr')[12]).to have_content '定休日： なし'
        expect(all('tbody tr')[12]).to have_content '営業時間： 24時間'
      end
    end
  end
end
