Rails.application.routes.draw do
  resources :coins
  resources :categories

  # Set the homepage to show the list of coins
  root "coins#index"
end