Rails.application.routes.draw do
  get "pages/about"
  resources :coins
  resources :categories

  # Set the homepage to show the list of coins
  get "about", to: "pages#about"
  root "coins#index"
end