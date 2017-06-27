require 'rails_helper'

describe Movie, type: :model do
  let(:movie) { FactoryGirl.build(:movie) }

  context 'associations' do
    it { should have_many(:categorizations) }
    it { should have_many(:genres) }
  end

  context 'validations' do
    it { should validate_presence_of(:title).with_message(/must be included!/) }
    it { should validate_length_of(:title).is_at_least(1).is_at_most(100).with_message(/must be between 1 and 100 characters!/) }
    it { should validate_length_of(:storyline).is_at_most(1000).with_message(/must be under 1000 characters!/) }
  end
end
