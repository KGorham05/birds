Rails.application.routes.draw do
  root "birds#index"

  resources :birds
  resources :sightings

  namespace :api do
    resources :birds
    resources :sightings
  end
end
