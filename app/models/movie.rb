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

  has_many :categorizations
  has_many :genres, through: :categorizations

  validates :title, presence: true
end
