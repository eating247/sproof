require 'rails_helper'

RSpec.describe MoviesController, type: :controller do
  let(:user) { FactoryGirl.create(:user) }

  context 'guest access' do
    describe '#index' do
      it 'renders the index template' do
        get :index
        response.should render_template :index
      end
    end

    describe '#show' do
      it 'renders the show view' do
        movie = FactoryGirl.create(:movie)
        get :show, id: movie.id
        response.should render_template :show
      end
    end
  end

  context 'signed-in user access' do
    describe '#create' do
      it 'is successful when user is authenticated' do
        sign_in(user)
        post :create, movie: FactoryGirl.attributes_for(:movie)
        expect(response).to redirect_to movies_path
      end

      it 'renders form when title is blank' do
        sign_in(user)
        post :create, movie: { title: nil }
        expect(response).to render_template :new
      end
    end
  end

  describe '#search' do
    it 'should render movies on search template' do
      movie = FactoryGirl.create(:movie)
      get :search, query: movie.title
      expect(response).to render_template :search
    end

    context 'when search results are empty' do
      it 'should render suggested template when search results are empty' do
        get :search, query: 'something'
        expect(response).to render_template :suggested
      end
    end
  end
end
