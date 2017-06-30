class SuggestedMovies
  def self.all
    Movie.order(created_at: :desc).limit(5)
  end
end
