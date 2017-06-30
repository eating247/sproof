module MoviesHelper
  def display_release_date(release)
    if release
      release.strftime('%b %d, %Y')
    else
      'no date given'
    end
  end

  def display_search_message(movies_length)
    if movies_length > 0
      pluralize( movies_length, 'Search Result' )
    else
      "Sorry, your search did not return any results."
    end
  end

end
