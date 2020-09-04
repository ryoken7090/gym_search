require 'rails_helper'
RSpec.describe Review, type: :system do
  before do
    @facility = create(:facility, name: 'Test fitness')
    @user = create(:user)
    create(:third_user)
  end
  describe 'review input form' do
    context 'When user login' do
      it "display review input form" do
        visit facility_path(@facility.id)
        expect(page).not_to have_content 'レビュー一覧'
        expect(page).not_to have_content 'レビューを書く'
        click_link 'ログイン'
        fill_in 'user_email', with: 'Test@example.com'
        fill_in 'user_password', with: 'password'
        click_button 'ログイン'
        visit facility_path(@facility.id)
        expect(page).not_to have_content 'レビュー一覧'
        expect(page).to have_content 'レビューを書く'
      end
    end
    context 'When post new review' do
      it "create new review and delete review input form" do
        login_as @user
        visit facility_path(@facility.id)
        expect(page).to have_content 'レビューを書く'
        within (all('.ratings')[0]) do
          all('.fa-star-o')[2].hover
          all('.fa-star')[2].click
        end
        within (all('.ratings')[1]) do
          all('.fa-star-o')[3].hover
          all('.fa-star')[3].click
        end
        within (all('.ratings')[2]) do
          all('.fa-star-o')[4].hover
          all('.fa-star')[4].click
        end
        fill_in 'review_content', with: 'テストのレビュー'
        expect(page).to have_content '3/5'
        expect(page).to have_content '4/5'
        expect(page).to have_content '5/5'
        click_button '保存'
        expect(page).to have_content 'テストユーザーさん'
        expect(page).to have_content 'テストのレビュー'
        expect(page).not_to have_content 'レビューを書く'
      end
    end
  end
end
