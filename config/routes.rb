Rails.application.routes.draw do
  root 'top#index'

  devise_for :users
  resources :users
  resources :favorites do
    collection do
      post :search
    end
  end
  resources :restaurants, :only => [] do
     collection do
       get 'draw'
     end
  end
end
