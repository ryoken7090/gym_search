require 'rails_helper'
RSpec.describe 'user model', type: :model do

  describe 'Validation' do
    context 'When necessary items are empty' do
      it "dont pass validation" do
        user = User.new(name: '', email: "test@test.com", password: "password")
        expect(user).not_to be_valid

        user = User.new(name: 'testuser', email: "test@test.com", password: "")
        expect(user).not_to be_valid

        user = User.new(name: 'testuser', email: "", password: "password")
        expect(user).not_to be_valid
      end
    end
    context 'When emails are duplicated' do
      it 'dont pass validation' do
        create(:user, email: "test@example.com")
        user = User.new(name: 'testuser', email: "test@example.com", password: "password")
        expect(user).not_to be_valid
      end
    end
  end
end
