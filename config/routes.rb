Rails.application.routes.draw do
  devise_for :users, controllers: {
        registrations: 'users/registrations'
  }
  resources :users, only: [:show]
  resources :facilities do
    collection do
      get :search
      post :confirm
    end
    resources :reviews, only: [:create]
  end
  root 'facilities#index'
end
