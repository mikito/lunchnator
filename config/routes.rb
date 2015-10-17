Rails.application.routes.draw do
  root 'top#index'

  devise_for :users
  resources :users
  resources :favorites
  resources :restaurants do
     collection do
       post 'draw'
     end
  end
end
