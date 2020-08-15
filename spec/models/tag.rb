require 'rails_helper'
RSpec.describe 'tag model', type: :model do
  describe 'The test of validation' do
    context 'When the name field is empty' do
      it 'dont pass validation' do
        tag = Tag.new(name: '')
        expect(tag).not_to be_valid
      end
    end
  end
end
