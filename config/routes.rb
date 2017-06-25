Rails.application.routes.draw do
  root to: 'movies#index'

  resources :movies do
    get 'search', on: :collection
  end
end
