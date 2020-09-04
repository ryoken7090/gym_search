require 'rails_helper'
RSpec.describe 'review model', type: :model do
  before do
    @user = create(:user)
    @facility = create(:facility)
  end
  describe 'Validation' do
    context 'When all items select' do
      it "pass validation" do
        review = Review.new(facility: @facility, user: @user, free_weight: 1, machine: 2, caedio: 3)
        expect(review).to be_valid
      end
    end

    context 'When dont input free_weight evaluation' do
      it "dont pass validation" do
        review = Review.new(facility: @facility, user: @user, machine: 2, caedio: 3)
        expect(review).not_to be_valid
      end
    end

    context 'When dont input machine evaluation' do
      it "dont pass validation" do
        review = Review.new(facility: @facility, user: @user, free_weight: 1, caedio: 3)
        expect(review).not_to be_valid
      end
    end

    context 'When dont input caedio evaluation' do
      it "dont pass validation" do
        review = Review.new(facility: @facility, user: @user, free_weight: 1, machine: 2)
        expect(review).not_to be_valid
      end
    end
  end
end
