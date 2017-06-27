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

  validates :title, presence: true, 
                    length: { in: 1..100 }
  validates :storyline, length: { maximum: 1000 }
end
