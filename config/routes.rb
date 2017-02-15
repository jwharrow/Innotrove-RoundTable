Rails.application.routes.draw do
  root 'application#index'
  resources :games, only: [:index, :show]
end
