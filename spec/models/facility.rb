require 'rails_helper'
RSpec.describe 'facility model', type: :model do
  before do
    @city = create(:city, name: 'テスト区')
    @user = create(:user)
  end
  describe 'Validation' do
    context 'When the name field is empty' do
      it 'dont pass validation' do
        facility = Facility.new(name: '', city_id: @city.id, poster_id: @user.id)
        expect(facility).not_to be_valid
      end
    end
    context 'When the city is not selected' do
      it 'dont pass validation' do
        facility = Facility.new(name: 'test name', poster_id: @user.id)
        expect(facility).not_to be_valid
      end
    end
    context 'When user dont login' do
      it 'dont pass validation' do
        facility = Facility.new(name: 'test name', city_id: @city.id)
        expect(facility).not_to be_valid
      end
    end
    context 'When the telephone number field is empty' do
      it 'pass validation' do
        facility = Facility.new(name: 'test name', city_id: @city.id, poster_id: @user.id, tell: '')
        expect(facility).to be_valid
      end
    end
    context 'When the telephone number has invalid digest' do
      it 'dont pass validation' do
        facility = Facility.new(name: 'test name', city_id: @city.id, poster_id: @user.id, tell: '0123-45-67890')
        expect(facility).not_to be_valid
        facility = Facility.new(name: 'test name', city_id: @city.id, poster_id: @user.id, tell: '0-123-4567')
        expect(facility).not_to be_valid
      end
    end
    context 'When the telephone number has valid digest' do
      it 'pass validation' do
        facility = Facility.new(name: 'test name', city_id: @city.id, poster_id: @user.id, tell: '012-345-6789')
        expect(facility).to be_valid
        facility = Facility.new(name: 'test name', city_id: @city.id, poster_id: @user.id, tell: '01(2345)6789')
        expect(facility).to be_valid
      end
    end
    context 'When the monthly fee is empty' do
      it 'pass validation' do
        facility = Facility.new(name: 'test_name', city_id: @city.id, poster_id: @user.id, monthly_fee: '')
        expect(facility).to be_valid
      end
    end
    context 'When the monthly fee has invalid digest' do
      it 'dont pass validation' do
        facility = Facility.new(name: 'test_name', city_id: @city.id, poster_id: @user.id, monthly_fee: '100')
        expect(facility).not_to be_valid
        facility = Facility.new(name: 'test_name', city_id: @city.id, poster_id: @user.id, monthly_fee: '1000000')
        expect(facility).not_to be_valid
      end
    end
    context 'When the monthly fee is valid' do
      it 'pass validation' do
        facility = Facility.new(name: 'test_name', city_id: @city.id, poster_id: @user.id, monthly_fee: '5000')
        expect(facility).to be_valid
        facility = Facility.new(name: 'test_name', city_id: @city.id, poster_id: @user.id, monthly_fee: '100000')
        expect(facility).to be_valid
      end
    end
  end
  describe 'avg_score method and avg_score_percentage' do
    before do
      @facility = create(:facility)
    end
    it "dont have reviews" do
      expect(@facility.avg_score(:machine)).to eq 0.0
      expect(@facility.avg_score_percentage(:machine)).to eq 0.0
    end
    it "have any reviews" do
      create(:review, machine: 4, facility: @facility)
      create(:review, machine: 1, facility: @facility)
      create(:review, machine: 1, facility: @facility)
      expect(@facility.avg_score(:machine)).to eq 2.0
      expect(@facility.avg_score_percentage(:machine)).to eq 40.0
    end
  end
end
