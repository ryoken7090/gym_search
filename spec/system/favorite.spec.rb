require 'rails_helper'
RSpec.describe Favorite, type: :system do
  before do
    @facility = create(:facility, name: 'Test fitness')
    @user = create(:user)
    login_as @user
  end
  context 'When create favorite' do
    it 'register favorite and display user page' do
      visit facility_path(@facility.id)
      click_link 'お気に入りする'
      expect(page).to have_content 'お気に入り解除'
      click_link 'マイページ'
      expect(page).to have_content 'お気に入りした設備情報'
      expect(page).to have_content 'Test fitness'
    end
  end
  context 'When delete favorite' do
    it 'remove favorite and dont display user page' do
      visit facility_path(@facility.id)
      click_link 'お気に入りする'
      expect(page).to have_content 'お気に入り解除'
      click_link 'マイページ'
      expect(page).to have_content 'お気に入りした設備情報'
      expect(page).to have_content 'Test fitness'
      click_link 'Test fitness'
      expect(page).to have_content 'お気に入り解除'
      click_link 'お気に入り解除'
      expect(page).to have_content 'お気に入りする'
      click_link 'マイページ'
      expect(page).not_to have_content 'Test fitness'
    end
  end
end
