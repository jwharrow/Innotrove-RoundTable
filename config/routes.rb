Rails.application.routes.draw do
  devise_for :users
  mount Ckeditor::Engine => '/ckeditor'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'application#index'
  resources :games, only: [:index, :show, :new, :create] do
    resources :revisions, only: [:index, :show, :new, :create]
  end
end
