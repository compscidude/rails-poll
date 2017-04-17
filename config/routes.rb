Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :poll_participations, only: :create  
  resources :polls, only: %i(create destroy show index new)
  resources :users, only: %i(create destroy index new)
  post 'login', to: 'users#login', as: :login
  root 'polls#index'


end
