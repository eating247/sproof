Movie.delete_all
Genre.delete_all

GENRES = ['Romance', 'Action', 'Horror', 'Thriller', 'Animation', 'Documentary', 'Comedy', 'Drama', 'Independent', 'Short', 'Art House'].freeze

GENRES.each do |genre|
  Genre.create(title: genre)
end
