module MoviesHelper
  def display_release_date(release)
    if release
      release.strftime('%b %d, %Y')
    else
      'no date given'
    end
  end
end
