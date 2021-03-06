require 'rails_helper'

feature 'User creates movie entries' do
  let(:user) { FactoryGirl.create(:user) }
  let!(:genre) { FactoryGirl.create(:genre) }
  before do
    sign_in(user)
    click_link 'Add movie'
  end

  scenario 'successfully when all fields are filled in' do
    expect(current_path).to eq(new_movie_path)
    fill_in 'Title', with: 'Tampopo'
    fill_in 'Storyline', with: 'Chashu with extra toppings'
    select '2017', from: 'movie_release_1i'
    select 'July', from: 'movie_release_2i'
    select '1', from: 'movie_release_3i'
    check('Romance')
    fill_in 'Link', with: 'http://www.imdb.com/title/tt0092048/'

    click_button 'Submit'

    expect(current_path).to eq(movies_path)
    expect(page).to have_text('Tampopo')
  end

  scenario 'unsuccessfully when no title is provided' do
    expect(current_path).to eq(new_movie_path)
    fill_in 'Storyline', with: 'Chashu with extra toppings'
    select '2017', from: 'movie_release_1i'
    select 'July', from: 'movie_release_2i'
    select '1', from: 'movie_release_3i'
    fill_in 'Link', with: 'http://www.imdb.com/title/tt0092048/'

    expect { click_button 'Submit' }.not_to change(Movie, :count)
  end
end
