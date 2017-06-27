Movie.delete_all
Genre.delete_all
User.delete_all

GENRES = ['Romance', 'Action', 'Horror', 'Thriller', 'Animation', 'Documentary', 'Comedy', 'Drama', 'Independent', 'Short', 'Art House'].freeze

GENRES.each do |genre|
  Genre.create(title: genre)
end

User.create(
  email: 'admin@istrator.com',
  password: 'password'
)
