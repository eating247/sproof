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

  validates :title, presence: { message: 'Your movie needs a title!' },
                    length: { in: 1..100, message: 'Sorry, we only accept movie titles under 100 characters!' }
  validates :storyline, length: { maximum: 1000, message: 'Please keep your storyline under 1000 characters!' }
end
