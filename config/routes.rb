Rails.application.routes.draw do
  devise_for :users, controllers: {
        registrations: 'users/registrations'
  }
  resources :users, only: [:show]
  resources :facilities do
    collection do
      post :confirm
    end
  end
  root 'facilities#index'
end
