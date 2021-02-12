Rails.application.routes.draw do
  root "birds#index"

  get "/birds", to: "birds#index"

  resources :birds
end
