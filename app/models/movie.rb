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
  belongs_to :genre

  validates :title, presence: true
end
