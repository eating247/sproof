require 'rails_helper'

feature 'User deletes movie' do
  let!(:movie) { FactoryGirl.create(:movie) }

  before do
    visit movie_path(movie)
  end

  scenario 'successfully' do
    expect { click_link 'Delete movie' }.to change(Movie, :count)
  end
end
