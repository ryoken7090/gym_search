Rails.application.routes.draw do
  devise_for :users
  resources :facilities do
    collection do
      post :confirm
    end
  end
  root 'facilities#index'
end
