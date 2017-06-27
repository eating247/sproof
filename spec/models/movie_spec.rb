require 'rails_helper'

describe Movie, type: :model do
  let(:movie){ FactoryGirl.build(:movie) }

  context 'validations' do
    it { should validate_presence_of(:title).with_message(/must be included!/) }
  end
end
