class Movie < ApplicationRecord
  include PgSearch
  pg_search_scope :search,
                  :against => [:title, :storyline],
                  :using => {
                    :tsearch => { prefix: true }
                  }
  belongs_to :genre

  validates_presence_of :title
end
