class Movie < ApplicationRecord
  include PgSearch
  pg_search_scope :search,
                  against: {
                    title: 'A',
                    storyline: 'B'
                  },
                  using: {
                    tsearch: {
                      prefix: true
                    }
                  }

  has_many :categorizations, dependent: :destroy
  has_many :genres, through: :categorizations

  validates :title, presence: { message: 'must be included!' },
                    length: { in: 1..100, message: 'must be between 1 and 100 characters!' }
  validates :storyline, length: { maximum: 1000, message: 'must be under 1000 characters!' }
  validates_with LinkValidator
end
