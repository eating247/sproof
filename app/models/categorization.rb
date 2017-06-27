class Categorization < ApplicationRecord
 belongs_to :genre
 belongs_to :movie

 validates :movie_id, :genre_id, presence: true
end
