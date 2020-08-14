require 'rails_helper'
RSpec.describe 'facility model', type: :model do
  describe 'The test of validation' do
    context 'When the name field is empty' do
      it 'pass validation' do
        facility = Facility.new(name: '')
        expect(facility).not_to be_valid
      end
    end
    context 'When the telephone number field is empty' do
      it 'pass validation' do
        facility = Facility.new(name: 'test name', tell: '')
        expect(facility).to be_valid
      end
    end
    context 'When the telephone number has invalid digest' do
      it 'dont pass validation' do
        facility = Facility.new(name: 'test name', tell: '0123-45-67890')
        expect(facility).not_to be_valid
        facility = Facility.new(name: 'test name', tell: '0-123-4567')
        expect(facility).not_to be_valid
      end
    end
    context 'When the telephone number has valid digest' do
      it 'pass validation' do
        facility = Facility.new(name: 'test name', tell: '012-345-6789')
        expect(facility).to be_valid
        facility = Facility.new(name: 'test name', tell: '01(2345)6789')
        expect(facility).to be_valid
      end
    end
    context 'When the monthly fee is empty' do
      it 'pass validation' do
        facility = Facility.new(name: 'test_name',monthly_fee: '')
        expect(facility).to be_valid
      end
    end
    context 'When the monthly fee has invalid digest' do
      it 'dont pass validation' do
        facility = Facility.new(name: 'test_name',monthly_fee: '100')
        expect(facility).not_to be_valid
        facility = Facility.new(name: 'test_name',monthly_fee: '1000000')
        expect(facility).not_to be_valid
      end
    end
    context 'When the monthly fee is valid' do
      it 'pass validation' do
        facility = Facility.new(name: 'test_name',monthly_fee: '5000')
        expect(facility).to be_valid
        facility = Facility.new(name: 'test_name',monthly_fee: '100000')
        expect(facility).to be_valid
      end
    end
  end
end
