require 'rails_helper'

describe Genre, type: :model do
  let(:genre) { FactoryGirl.build(:genre) }

  context 'associations' do
    it { should have_many(:categorizations) }
    it { should have_many(:movies) }
  end

  context 'validations' do
    it { should validate_presence_of(:title) }
    it { should validate_length_of(:title).is_at_least(1).is_at_most(60) }
  end
end
