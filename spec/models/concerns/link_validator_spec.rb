require 'rails_helper'

class Validatable
  include ActiveModel::Validations
  validates_with LinkValidator
  attr_accessor :link
end

describe LinkValidator do
  subject { Validatable.new }

  context 'with http' do
    it 'is valid' do
      subject.link = "http://www.imdb.com/title/tt0092048/" 
      expect(subject).to be_valid
    end
  end

  context 'with https' do
    it 'is valid' do
      subject.link = "https://www.imdb.com/title/tt0092048/" 
      expect(subject).to be_valid
    end
  end

  context 'without correct protocols' do
    it 'is invalid' do
      subject.link = "imdb.com/title/tt0092048/"
      expect(subject).to be_invalid
    end
  end

  context 'with an IMDB domain' do
    it 'is valid' do
      ["http://www.imdb.com/title/tt0092048/", "https://m.imdb.com/title/tt0092048/"].each do |link|
        subject.link = link
        expect(subject).to be_valid
      end
    end
  end

  context 'without an IMDB domain' do
    it 'is invalid' do
      ["https://qz.com/", "http://www.imbd.com/title/tt0092048/", "http://random.imdb.com"].each do |link|
        subject.link = link
        expect(subject).to be_invalid
      end
    end
  end
end
