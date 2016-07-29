Rails.application.routes.draw do
  get 'sessions/sign_in'
  delete 'sessions/sign_out'
  post 'sessions/authenticate'

  resources :boards
  resources :downvotes
  resources :users
  resources :upvotes
  resources :links

  root 'dashboard#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
