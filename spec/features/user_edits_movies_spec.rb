require 'rails_helper'

feature 'User edits movie' do
  let!(:movie) { FactoryGirl.create(:movie) }
  let(:user){ FactoryGirl.create(:user) }

  before do
    sign_in(user)
    visit movie_path(movie)
    click_link 'Edit movie'
    expect(current_path).to eq(edit_movie_path(movie))
  end

  scenario 'successfully' do
    fill_in 'Title', with: 'Inception'
    fill_in 'Storyline', with: 'some trippy ish'
    select '2014', from: 'movie_release_1i'
    select 'May', from: 'movie_release_2i'
    check('Romance') 
    select '10', from: 'movie_release_3i'
    fill_in 'Link', with: 'http://www.imdb.com/title/tt1375666'

    click_button 'Submit'

    expect(current_path).to eq(movie_path(movie))
    expect(page).to have_text('Inception')
  end

  scenario 'unsuccessfully' do
    fill_in 'Title', with: ''
    click_button 'Submit'

    expect(page).to have_text('Update Movie')
  end
end
