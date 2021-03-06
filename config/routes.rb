Rails.application.routes.draw do
  get 'new_review', to: 'reviews#new'

  post 'reviews', to: 'reviews#create'

  devise_for :users
  get 'shows/index'

  resources :shows

  root 'static_pages#index'

  resources :users, only: [:show]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
