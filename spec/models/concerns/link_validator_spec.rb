require 'rails_helper'

class Validatable
  include ActiveModel::Validations
  validates_with LinkValidator
  attr_accessor :link
end

describe LinkValidator do
  subject { Validatable.new }

  VALID_LINKS = ['http://www.imdb.com/title/tt0092048/', 'https://www.imdb.com/title/tt0092048/', 'http://www.imdb.com/title/tt0092048/', 'https://m.imdb.com/title/tt0092048/'].freeze
  INVALID_LINKS = ['imdb.com/title/tt0092048/', 'https://qz.com/', 'http://www.imbd.com/title/tt0092048/', 'http://random.imdb.com'].freeze

  VALID_LINKS.each do |valid_link|
    it "#{valid_link.inspect} is a valid imdb link" do
      subject.link = valid_link
      expect(subject).to be_valid
      expect(subject.errors.full_messages).to be_empty
    end
  end

  INVALID_LINKS.each do |invalid_link|
    it "#{invalid_link.inspect} is an invalid imdb link" do
      subject.link = invalid_link
      expect(subject).to be_invalid
      expect(subject.errors.full_messages).not_to be_empty
    end
  end
end
